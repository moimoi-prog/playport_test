import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:playport_test/module/CameraModule.dart';


class MatchingSettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("マッチング設定"),
          ),
          body:     SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Text('項目'),
                    onTap: () {
                      Fluttertoast.showToast(msg: "クリックしました。");
                    }),
                ListTile(
                    title: Text('戻る'),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          )
      );
  }
}