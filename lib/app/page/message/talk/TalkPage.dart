import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabNotifier.dart';
import 'package:provider/provider.dart';
import 'TalkDetailSearchWidget.dart';
import 'TalkDetailsWidget.dart';
import 'TalkSendWidget.dart';

// ----------------------------------
// クラス名　: TalkPage
// 処理概要　: トーク画面
// ----------------------------------
class TalkPage extends StatefulWidget {
  /* トークID     */ final String id;
  /* 画像        */ final String image;
  /* トーク名     */ final String title;
  /* 相手        */ final String opponent;
  /* timestamp  */ final Timestamp create;

  TalkPage({Key key, this.id, this.image, this.title, this.opponent, this.create}) : super(key: key);

  @override
  _TalkPageState createState() => _TalkPageState();

}

class _TalkPageState extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          // タイムスタンプを生成
          DateTime now = DateTime.now();

          await readTalk(widget.id, now);

          Provider.of<MessageTabNotifier>(context, listen: false).loadTalk(widget.id);

          Navigator.of(context).pop();

          return null;
        },
        child: Scaffold(
          appBar: AppBar(
            title:
            Text(widget.title),
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
                  TalkDetailSearchWidget(),

                  // トーク内容表示用Widget
                  TalkDetailsWidget(id: widget.id, create: widget.create, image: widget.image),

                  // トーク送信用Widget
                  TalkSendWidget(id: widget.id, opponent: widget.opponent),
                ])),
          ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
        ),
      ),
    );
  }
}
