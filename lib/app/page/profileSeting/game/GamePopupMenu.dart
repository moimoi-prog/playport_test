import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/enum/OperationMenuType.dart';

import 'GameEditBottmnSheet.dart';
import 'GameUpdatePage.dart';

// ゲームポップアップメニュー
class GamePopupMenu extends StatelessWidget {
  final DocumentSnapshot document;

  const GamePopupMenu({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<OperationMenuType>(
      icon: Icon(Icons.settings),
      onSelected: (OperationMenuType result) async {
        if (result == OperationMenuType.edit) {
          // シャウト編集画面を表示する
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return GameUpdatePage(document: document);
              },
            ),
          );
          Fluttertoast.showToast(msg: "シャウトを編集する");

        } else if (result == OperationMenuType.delete) {
          showGameEditBottmnSheet(context, document);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<OperationMenuType>>[
        // 編集ボタン
        const PopupMenuItem<OperationMenuType>(
          value: OperationMenuType.edit,
          child: Text("編集")
        ),

        // 削除ボタン
        const PopupMenuItem<OperationMenuType>(
          value: OperationMenuType.delete,
          child: Text("削除"),
        ),
      ],
    );
  }
}