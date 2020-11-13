import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/StorageModule.dart';
import 'package:playport_test/firebase/firestore/AutosModule.dart';
import 'package:playport_test/firebase/firestore/GroupModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/module/CameraModule.dart';
import 'package:image/image.dart' as hogehoge;


void showGroupOperationBottmnSheet(BuildContext context, String id) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Text('カメラで撮影する'),
                onTap: () async {
                  // 画像を取得
                  File file = await getAndSaveImageFromDevice(ImageSource.camera);

                  hogehoge.Image image = hogehoge.decodeImage(file.readAsBytesSync());

                  // 画像をアップロード
                  uploadImage(file).then((path) => sendGroupImage(id, user.uid, path, "image", image.width, image.height));

                  // pop
                  Navigator.of(context).pop();

                }),
            ListTile(
                title: Text('ライブラリから選択する'),
                onTap: () async {
                  // 画像を取得
                  File file = await getAndSaveImageFromDevice(ImageSource.gallery);

                  // 画像をデコード
                  hogehoge.Image image = hogehoge.decodeImage(file.readAsBytesSync());

                  // 画像をアップロード
                  uploadImage(file).then((path) => sendGroupImage(id, user.uid, path, "image", image.width, image.height));

                  // pop
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
