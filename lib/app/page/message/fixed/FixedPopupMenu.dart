import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/enum/OperationMenuType.dart';

import 'FixedEditBottmnSheet.dart';
import 'FixedUpdatePage.dart';

// ゲームポップアップメニュー
class FixedPopupMenu extends StatelessWidget {
  final DocumentSnapshot document;

  const FixedPopupMenu({Key key, this.document}) : super(key: key);

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
                return FixedUpdatePage(document: document);
              },
            ),
          );

        } else if (result == OperationMenuType.delete) {
          showFixedEditBottmnSheet(context, document);
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