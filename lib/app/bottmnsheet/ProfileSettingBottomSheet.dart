import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ---------------------------------------------------
// メソッド名: showProfileSettingBottomSheet
// 処理概要　: プロフィールに対する操作
// ---------------------------------------------------
void showProfileSettingBottomSheet(BuildContext context, DocumentSnapshot document) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Text('プロフィール画像を選択'),
                onTap: () {
                  Fluttertoast.showToast(msg: "プロフィール画像を選択");
                }),
            ListTile(
                title: Text('背景画像を選択'),
                onTap: () {
                  Fluttertoast.showToast(msg: "背景画像を選択");
                }),
            ListTile(
                title: Text('名前を変更'),
                onTap: () {
                  Fluttertoast.showToast(msg: "名前を変更");
                }),
            ListTile(
                title: Text('自己紹介を変更'),
                onTap: () {
                  Fluttertoast.showToast(msg: "自己紹介を変更");
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
