import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playport_test/module/CameraModule.dart';

import 'BackgroundImageCroPage.dart';
import 'game/GameEditPage.dart';
import 'game/GameRegisterPage.dart';
import 'ProfileImageCropPage.dart';
import 'UserIntroductionChangePage.dart';
import 'UserNameChangePage.dart';

class ProfileSettingPage extends StatelessWidget {
  /* ユーザーID */ final String uid;

  const ProfileSettingPage({Key key, this.uid}) : assert(uid != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        appBar: AppBar(
          title: Text("プロフィールを編集"),
        ),
        body:     SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  title: Text('名前を変更'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return UserNameChangePage();
                        },
                      ),
                    );
                  }),
              ListTile(
                  title: Text('自己紹介を変更'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return UserIntroductionChangePage();
                        },
                      ),
                    );                  }),
              ListTile(
                  title: Text('プロフィール画像を選択'),
                  onTap: () async {
                    File image = await getAndSaveImageFromDevice(ImageSource.gallery);
                    if (image != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileImageCropPage(image: image);
                          },
                        ),
                      );
                    }
                  }),
              ListTile(
                  title: Text('背景画像を選択'),
                  onTap: () async {
                    File image = await getAndSaveImageFromDevice(ImageSource.gallery);
                    if (image != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return BackgroundImageCropPage(image: image);
                          },
                        ),
                      );
                    }
                  }),
              ListTile(
                  title: Text('ゲームを登録'),
                  onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return GameRegisterPage();
                          },
                        ),
                      );
                  }),
              ListTile(
                  title: Text('ゲームを編集'),
                  onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return GameEditPage();
                          },
                        ),
                      );
                  }),
              ListTile(
                  title: Text('キャンセル'),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        )
      );
  }
}