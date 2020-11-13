import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------------
// プロフィールデータパーツ
// ------------------------------------
class ProfileMessageWidget extends StatelessWidget {
  /* ユーザーID */ final String uid;

  ProfileMessageWidget({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
            if (!doc.hasData) {
              return Text("ユーザー名を取得中・・・");
            }

            if (doc.data == null) {
              return Text("Error: ユーザー名が不明です。");
            }

            return Text(
              doc.data.data()[Strings.INTRODUCTION],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            );
          }),
    );
  }
}
