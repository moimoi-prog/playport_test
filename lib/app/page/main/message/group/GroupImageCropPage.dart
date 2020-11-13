import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/StorageModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';
import 'package:playport_test/pub/simple_image_crop.dart';
import 'package:playport_test/state/createGroupPage/CreateGroupNotifier.dart';
import 'package:provider/provider.dart';

class GroupImageCropPage extends StatelessWidget {
  final cropKey = GlobalKey<ImgCropState>();
  final File image;

  GroupImageCropPage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('グループイメージを選択'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: ImgCrop(
                  key: cropKey,
                  chipRadius: 100,
                  chipShape: ChipShape.circle,
                  // chipRatio: 2 / 1,
                  // maximumScale: 3,
                  image: FileImage(image),
                  // handleSize: 0.0,
                ),
              ),
            ),
            RaisedButton(
              child: Text("決定"),
              onPressed: () async {
                // 画像を円形に切り取る
                final crop = cropKey.currentState;
                final croppedFile = await crop.cropCompleted(image, preferredSize: 1000);

                // パスをステータスに保存
                Provider.of<CreateGroupNotifier>(context, listen: false).setImagePath(croppedFile.path);

                // await setProfileImagePath(path);

                Fluttertoast.showToast(msg: "プロフィール画像を変更しました。");
                Navigator.of(context).pop();

              },
            )
          ],
        ),
      ),
    );
  }

  Future<Null> showImage(BuildContext context, File file) async {
    return showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Current screenshot：',
            ),
            content: ClipOval(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                child: Container(
                  width: 110.0,
                  height: 110.0,
                  child: Image.file(file),
                ),
              ),
            ),
          );
        });
  }
}
