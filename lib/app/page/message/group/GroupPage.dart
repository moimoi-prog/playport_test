import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/GroupModule.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabNotifier.dart';
import 'package:provider/provider.dart';
import 'GroupDetailSearchWidget.dart';
import 'GroupDetailsWidget.dart';
import 'GroupSendWidget.dart';

// ----------------------------------
// クラス名　: TalkPage
// 処理概要　: トーク画面
// ----------------------------------
class GroupPage extends StatefulWidget {
  /* グループID */ final String id;
  /* グループ名 */ final String name;
  /* 作成日    */ final Timestamp create;

  const GroupPage({ // コンストラクタ
    Key key,
    this.id, // グループID
    this.name, // グループ名
    this.create // 作成日
  }) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();

}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          readGroup(widget.id);
          Provider.of<MessageTabNotifier>(context, listen: false).loadGroup(widget.id);
          Navigator.pop(context);
          return null;
        },
        child: Scaffold(
          appBar: AppBar(
            title:
            Text(widget.name),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
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
                  GroupDetailSearchWidget(),

                  // トーク内容表示用Widget
                  GroupDetailsWidget(id: widget.id, create: widget.create),

                  // トーク送信用Widget
                  GroupSendWidget(id: widget.id),
                ])),
          ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
        ),
      ),
    );
  }
}
