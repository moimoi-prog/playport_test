import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';


Future<bool> showRequestConfirmDialog(BuildContext context, DocumentSnapshot doc) async {
  showDialog(
    context: context,
    builder: (_) {
      return Center(
          child: AlertDialog(
        title: Text("フレンド申請を送信しますか?"),
        content: Text(doc.data()[Strings.NAME]),
        actions: <Widget>[
          // ボタン領域
          FlatButton(
            child: Text("Cancel"),
            onPressed: ()  async {
              await sendFriendRequest(user.uid, doc.data()[Strings.UID]);
              Navigator.of(context).pop();
              return false;
            },
          ),
          FlatButton(
            child: Text("OK"),
            onPressed: () {

              Navigator.of(context).pop();
              return true;
            }
          ),
        ],
      ));
    },
  );
}
