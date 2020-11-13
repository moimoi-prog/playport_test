import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/message/talk/TalkPage.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/RoomType.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';

import '../../widget/CircleImageWidget.dart';

// ------------------------------------
// フレンド申請ページ
// ------------------------------------
class FriendListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("フレンドリスト"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FRIENDS).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> requests) {
            if (!requests.hasData) {
              return Text("フレンドリストを取得中・・・");
            }

            if (requests.data.size == 0) {
              return Text("フレンドデータが存在しません");
            }

            return ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              itemCount: requests.data.size,
              itemBuilder: (context, index) => _buildListItem(context, requests.data.docs[index]),
            );
          }),
    );
  }

  // 複数のボタン付きのタイルを一覧表示
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProfilePage(uid: document.data()[Strings.UID]);
              },
            ),
          );
        },
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              // ユーザーイメージを表示
              leading: UserImageWidget(uid: document.data()[Strings.UID], radius: MediaQuery.of(context).size.width / 8, color: Colors.grey),
              title: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(document.data()[Strings.UID]).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                    if (!doc.hasData) {
                      return Text("ユーザー名を取得中・・・");
                    }

                    if (doc.data == null) {
                      return Text("Error: ユーザー名が不明です。");
                    }

                    return Text(doc.data.data()[Strings.NAME]);
                  }),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () async {
                      // ルームIDを格納する変数
                      String roomId;
                      Timestamp create;

                      // ルームのタイトルを取得
                      // → 相手のユーザー名
                      String title = (await FirebaseFirestore.instance.collection(Strings.USERS).doc(document.data()[Strings.UID]).get()).data()[Strings.NAME];

                      // 自分側にルームが登録されているかを判定する
                      QuerySnapshot query1 = await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.ROOMS).where(Strings.OPPONENT, isEqualTo: document.data()[Strings.UID]).get();

                      // 自分側にルームが登録されている場合
                      if (query1.size == 1) {
                        // 作成済みである場合、既存のルームIDを格納
                        roomId = query1.docs[0].data()[Strings.ID];
                        create = query1.docs[0].data()[Strings.CREATE];

                      } else {
                        create = Timestamp.now();

                        // 相手側にルームが登録されているかを判定する
                        QuerySnapshot query2 = await FirebaseFirestore.instance.collection(Strings.USERS).doc(document.data()[Strings.UID]).collection(Strings.ROOMS).where(Strings.OPPONENT, isEqualTo: user.uid).get();

                        // 相手側にルームが登録されている場合
                        if (query2.size == 1) {
                          // 作成済みである場合、既存のルームIDを格納
                          roomId = query2.docs[0].data()[Strings.ID];

                          // 自分側にもルームを登録
                          await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.ROOMS).doc(roomId).set(<String, dynamic>{Strings.ID: roomId, Strings.TYPE: "message", Strings.OPPONENT: document.data()[Strings.UID], Strings.CREATE: create, Strings.READ: create});

                        } else {
                          // 未作成である場合、作成しルームIDを格納
                          roomId =  await registerTalk(user.uid, document.data()[Strings.UID]);
                        }
                      }
                      // タイムスタンプを生成
                      DateTime now = DateTime.now();


                      await readTalk(roomId, now);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return TalkPage(id: roomId, title: title, opponent: document.data()[Strings.UID], create: create);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
