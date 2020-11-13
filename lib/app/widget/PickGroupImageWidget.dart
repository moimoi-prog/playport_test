import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playport_test/firebase/StorageModule.dart';
import 'package:playport_test/module/CameraModule.dart';
import 'package:playport_test/module/CommonModule.dart';

Future<String> pickGroupImage(BuildContext context) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("カメラで撮影する"),
                  onTap: () async {
                    // 画像を取得
                    File file = await getAndSaveImageFromDevice(ImageSource.camera);

                    // 画像を圧縮
                    File compressionFile = await imageCompression(file, 600, 600);

                    // 画像をアップロード
                    String path = await uploadImage(compressionFile);

                    // パスを返却
                    return path;
                  }),
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("ギャラリーから選択する"),
                  onTap: () async {
                    // 画像を取得
                    File file = await getAndSaveImageFromDevice(ImageSource.gallery);

                    // 画像を圧縮
                    File compressionFile = await imageCompression(file, 600, 600);

                    // 画像をアップロード
                    String path = await uploadImage(compressionFile);

                    // パスを返却
                    return path;
                  })
            ],
          )));
}
