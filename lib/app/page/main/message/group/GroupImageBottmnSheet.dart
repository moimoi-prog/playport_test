import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playport_test/app/page/message/talk/TalkPage.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/module/CameraModule.dart';

import 'GroupImageCropPage.dart';

void showGroupImageBottmnSheet(BuildContext context) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.camera_alt),
                    Text(' カメラで撮影する')
                  ],
                ),
                onTap: () async {
                  File image = await getAndSaveImageFromDevice(ImageSource.camera);
                  Navigator.of(context).pop();
                  if (image != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return GroupImageCropPage(image: image);
                        },
                      ),
                    );
                  }
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.image),
                    Text(' ギャラリーから選択する')
                  ],
                ),
                onTap: () async {
                  File image = await getAndSaveImageFromDevice(ImageSource.gallery);
                  Navigator.of(context).pop();
                  if (image != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return GroupImageCropPage(image: image);
                        },
                      ),
                    );
                  }
                }),
            ListTile(
                title: Text('キャンセル', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      );
    },
  );
}
