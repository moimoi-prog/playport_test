import 'package:flutter/material.dart';
import 'package:playport_test/app/page/message/fixed/FixedEditPage.dart';
import 'package:playport_test/app/page/message/fixed/FixedRegisterPage.dart';
import 'package:playport_test/data/enum/MessageOperationMenuType.dart';

// シャウトポップアップメニュー
class MessagePopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<MessageOperationMenuType>(
      icon: Icon(Icons.settings),
      onSelected: (MessageOperationMenuType result) async {
        if (result == MessageOperationMenuType.fixed_add) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return FixedRegisterPage();
              },
            ),
          );

        } else if (result == MessageOperationMenuType.fixed_delete) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return FixedEditPage();
              },
            ),
          );        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MessageOperationMenuType>>[
        // 編集ボタン
        const PopupMenuItem<MessageOperationMenuType>(
            value: MessageOperationMenuType.fixed_add,
            child: Text("定型文を追加")
        ),

        // 削除ボタン
        const PopupMenuItem<MessageOperationMenuType>(
          value: MessageOperationMenuType.fixed_delete,
          child: Text("定型文を編集"),
        ),
      ],
    );
  }
}