import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/bottmnsheet/PostDeleteBottomSheet.dart';
import 'package:playport_test/app/page/main/shout/ShoutAddPage.dart';
import 'package:playport_test/data/enum/OperationMenuType.dart';

// シャウトポップアップメニュー
class PostPopupMenu extends StatelessWidget {
  final DocumentSnapshot document;

  const PostPopupMenu({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<OperationMenuType>(
      icon: Icon(Icons.keyboard_arrow_down),
      onSelected: (OperationMenuType result) async {
        if (result == OperationMenuType.edit) {
          // シャウト編集画面を表示する
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ShoutAddPage(document: document);
              },
            ),
          );
          Fluttertoast.showToast(msg: "シャウトを編集する");

        } else if (result == OperationMenuType.delete) {
          showPostDetailBottomSheet(context, document);
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