import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/main/matching/FriendButtons.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

import '../../widget/CircleImageWidget.dart';
import '../../button/ProfileDataSettingButton.dart';

// ------------------------------------
// プロフィールデータパーツ
// ------------------------------------
class ProfileDataWidget extends StatelessWidget {
  /* 画面の横幅 */ final double width;
  /* ユーザーID */ final String uid;

  const ProfileDataWidget({Key key, this.width, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: width,
              height: (width / 3) + (width / 8) + 5,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                  if (!doc.hasData) {
                    return Container(
                      width: width,
                      height: width / 3,
                      color: Colors.red,
                    );
                  }
                  if (!doc.data.data().containsKey(Strings.BACKGROUND_IMAGE_PATH)) {
                    return Container(
                      width: width,
                      height: width / 3,
                      color: Colors.red,
                    );
                  }

                  return Container(width: width, height: width / 3, decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(doc.data.data()[Strings.BACKGROUND_IMAGE_PATH]))));
                }),
            Positioned(
              left: (width / 2) - (width / 8) - 5,
              top: (width / 3) - (width / 8) - 5,
              child: ClipOval(
                  child: Container(
                      width: width / 4 + 10,
                      height: width / 4 + 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ))),
            ),

            // ユーザーイメージ
            Positioned(
              left: (width / 2) - (width / 8),
              top: (width / 3) - (width / 8),
              child: ClipOval(
                child: UserImageWidget(uid: uid, radius: width / 4, color: Colors.grey),
              ),
            ),
            Positioned(
              top: width / 3,
              child: Container(
                padding: EdgeInsets.only(right: 5.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                  uid == user.uid
                      ? ProfileDataSettingButton(uid: uid)
                      : StreamBuilder(
                          stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FRIENDS).doc(uid).snapshots(),
                          // ignore: missing_return
                          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                            if (!doc.hasData) {
                              return Text("");
                            }

                            if (doc.data.exists) {
                              // フレンドであることを示す
                              return FriendButton(color: Theme.of(context).primaryColor);
                            } else {
                              return StreamBuilder(
                                  stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).collection(Strings.REQUESTS).doc(user.uid).snapshots(),
                                  // ignore: missing_return
                                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                                    if (!doc.hasData) {
                                      return Text("");
                                    }

                                    if (doc.data.exists) {
                                      // リクエスト送信中あることを示す
                                      return RequestButton(color: Theme.of(context).primaryColor);
                                    }

                                    // リクエストを送信する
                                    return SendButton(color: Theme.of(context).primaryColor, uid: uid);
                                  });
                            }
                          })
                ]),
                width: width,
                height: width / 8,
              ),
            ),
          ],
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
              if (!doc.hasData) {
                return Text("ユーザー名を取得中・・・");
              }

              if (doc.data == null) {
                return Text("Error: ユーザー名が不明です。");
              }

              return Text(doc.data.data()[Strings.NAME]);
            }),
      ],
    );
  }
}
