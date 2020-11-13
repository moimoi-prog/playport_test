import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/enum/RoomType.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'AutoDetailSearchWidget.dart';
import 'AutoDetailsWidget.dart';
import 'AutoSendWidget.dart';

// ----------------------------------
// クラス名　: TalkPage
// 処理概要　: トーク画面
// ----------------------------------
class AutoPage extends StatefulWidget {
  /* トークID     */ final String id;
  /* トーク名     */ final String title;
  /* 相手        */ final String opponent;
  /* timestamp  */ final Timestamp create;

  AutoPage({Key key, this.id, this.title, this.opponent, this.create}) : super(key: key);

  @override
  _AutoPageState createState() => _AutoPageState();

}

class _AutoPageState extends State<AutoPage> {
  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          // タイムスタンプを生成
          DateTime now = DateTime.now();


          readTalk(widget.id, now);
          Navigator.pop(context);
          return null;
        },
        child: Scaffold(
          appBar: AppBar(
            title:
            Text(widget.title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Fluttertoast.showToast(msg: "設定ボタンをタップしました。");
                },
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // トーク内容検索用Widget
                  AutoDetailSearchWidget(),

                  // トーク内容表示用Widget
                  AutoDetailsWidget(id: widget.id, create: widget.create),

                  // トーク送信用Widget
                  AutoSendWidget(id: widget.id, opponent: widget.opponent),
                ])),
          ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
        ),
      ),
    );
  }
}
