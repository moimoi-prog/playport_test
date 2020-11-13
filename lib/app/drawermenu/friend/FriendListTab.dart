import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/message/talk/TalkPage.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/RoomType.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';
import 'package:playport_test/module/CommonModule.dart';

class FriendListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FRIENDS).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> friend) {
          if (!friend.hasData) {
            return Text("フレンドリストを取得中・・・");
          }

          if (friend.data.size == 0) {
            return Text("フレンドデータが存在しません");
          }

          return ListView.separated(
            padding: EdgeInsets.only(top: 10.0),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: friend.data.size,
            itemBuilder: (context, index) => _buildListItem(context, friend.data.docs[index]),
          );
        });
  }

  // 複数のボタン付きのタイルを一覧表示
  Widget _buildListItem(BuildContext context, DocumentSnapshot friend) {
    return InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProfilePage(uid: friend.data()[Strings.UID]);
              },
            ),
          );
        },
        child: Container(
            child: FutureBuilder(
          future: FirebaseFirestore.instance.collection(Strings.USERS).doc(friend.data()[Strings.UID]).get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
            if (!doc.hasData) {
              return Text("ユーザーを取得中・・・");
            }

            if (doc.data == null) {
              return Text("Error: ユーザーの取得に失敗しました");
            }

            return ListTile(
              // ユーザーイメージを表示
              leading: UserImageWidget(uid: friend.data()[Strings.UID], radius: MediaQuery.of(context).size.width / 8, color: Colors.grey),
              title: Text(doc.data.data()[Strings.NAME]),
              subtitle: !doc.data.data().containsKey(Strings.LOGIN_FLAG)
                  ? Text("")
                  : Text("最終ログイン: " + getFormattedDate("yyyy/MM/dd", doc.data.data()[Strings.LOGIN_TIME].toDate())
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () async {
                      // ルームIDを格納する変数
                      String roomId;
                      Timestamp create;

                      // 相手のユーザー名を取得する
                      String title = (await getUser(friend.data()[Strings.UID])).data()[Strings.NAME];

                      // 自分側にルームが登録されているかを判定する
                      DocumentSnapshot doc = await getTalk(user.uid, friend.data()[Strings.UID]);

                      // 自分側にルームが登録されている場合
                      if (doc != null) {
                        // 作成済みである場合、既存のルームIDを格納
                        roomId = doc.data()[Strings.ID];
                        create = doc.data()[Strings.CREATE];
                      } else {
                        create = Timestamp.now();

                        // 相手側にルームが登録されているかを判定する
                        DocumentSnapshot doc2 = await getTalk(friend.data()[Strings.UID], user.uid);

                        // 相手側にルームが登録されている場合
                        if (doc2 != null) {
                          // 作成済みである場合、既存のルームIDを格納
                          roomId = doc2.data()[Strings.ID];

                          // 自分側にルームデータを登録
                          await registerUserTalk(roomId, friend.data()[Strings.UID]);

                        } else {
                          // 未作成である場合、作成しルームIDを格納
                          roomId = await registerTalk(user.uid, friend.data()[Strings.UID]);
                        }
                      }

                      // タイムスタンプを生成
                      DateTime now = DateTime.now();


                      await readTalk(roomId, now);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return TalkPage(id: roomId, title: title, opponent: friend.data()[Strings.UID], create: create);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        )));
  }
}
