import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/message/talk/TalkPage.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';

// ---------------------------------------------------
// メソッド名: showMessageOperationBottomSheet
// 処理概要　: メッセージに対する操作
// ---------------------------------------------------
void showMessageOperationBottomSheet(BuildContext context, DocumentSnapshot document) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Text('開く'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return TalkPage(id: document.data()[Strings.ID], title: document.data()[Strings.NAME]);
                      },
                    ),
                  );
                }),
            ListTile(
                title: Text('削除する', style: TextStyle(color: Colors.red),),
                onTap: () async {
                  // roomデータを削除
                  await deleteTalk(document.id);
                  // FirebaseFirestore.instance.collection("rooms").doc(document.id).delete();
                  // シャウト削除ダイアログを表示する
                  Fluttertoast.showToast(msg: "メッセージを削除しました。");

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
