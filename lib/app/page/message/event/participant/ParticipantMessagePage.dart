import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

import 'ParticipantDetailSearchWidget.dart';
import 'ParticipantDetailsWidget.dart';
import 'ParticipantSendWidget.dart';

class ParticipantMessagesPage extends StatelessWidget {
  /* イベントデータ */ final DocumentSnapshot request;
  /* タイトル 　　　*/ final String title;

  ParticipantMessagesPage({Key key, this.request, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // トーク内容検索用Widget
                ParticipantDetailSearchWidget(),

                // メッセージ内容表示用Widget
                ParticipantDetailsWidget(id: request.data()[Strings.INQUIRY]),

                // メッセージ送信用Widget
                ParticipantSendWidget(id: request.data()[Strings.INQUIRY]),
              ])),
        ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
      ),
    );
  }
}
