import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

void showFixedEditBottmnSheet(BuildContext context, DocumentSnapshot document) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Text('削除する', style: TextStyle(color: Colors.red),),
                onTap: () {
                  // データを削除
                  FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FIXED).doc(document.id).delete();
                  // シャウト削除ダイアログを表示する
                  Fluttertoast.showToast(msg: "定型文を削除しました。");

                  Navigator.of(context).pop();
                }),
            ListTile(
                title: Text('キャンセル'),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      );
    },
  );
}
