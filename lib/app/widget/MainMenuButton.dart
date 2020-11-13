import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ------------------------------------
// メインメニューの右上に表示するボタン
// ------------------------------------
class MainMenuButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        Fluttertoast.showToast(msg: "メニューボタンを押下しました");
      },
    );
  }
}