import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/app/widget/UserNameWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

// ------------------------------------
// フレンド申請ページ
// ------------------------------------
class FriendRequestTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.REQUESTS).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> requests) {
          if (!requests.hasData) {
            return Text("申請リストを取得中・・・");
          }

          if (requests.data.size == 0) {
            return Text("申請データが存在しません");
          }

          return ListView.separated(
            padding: EdgeInsets.only(top: 10.0),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: requests.data.size,
            itemBuilder: (context, index) => _buildListItem(context, requests.data.docs[index]),
          );
        });
  }

  // 複数のボタン付きのタイルを一覧表示
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return InkWell(
        onTap: () async {
          Fluttertoast.showToast(msg: document.data()[Strings.NAME] + "をクリックしました");
        },
        child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: UserImageWidget(uid: document.data()[Strings.UID], radius: MediaQuery.of(context).size.height / 12, color: Colors.grey),
                  title: UserNameWidget(uid: document.data()[Strings.UID]),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.check_circle_outline),
                        onPressed: () async {
                          await approvalFriendRequest(document);
                          Fluttertoast.showToast(msg: "フレンド申請を承認しました");
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () async {
                          await rejectFriendRequest(document);
                          Fluttertoast.showToast(msg: "フレンド申請を拒否しました");
                        },
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
