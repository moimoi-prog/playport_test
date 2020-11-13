import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/widget/NoMessageWidget.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/RoomType.dart';

import 'WholeDetailSearchWidget.dart';
import 'WholeDetailsWidget.dart';
import 'WholeSendWidget.dart';

class WholeMessagesTab extends StatelessWidget {
  final String id;

  WholeMessagesTab({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 処理中画面
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                // トーク内容検索用Widget
                WholeDetailSearchWidget(),

                // メッセージ内容表示用Widget
                WholeDetailsWidget(id: id),

                // メッセージ送信用Widget
                WholeSendWidget(id: id),

              ])),
        ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
      ),
    );
  }
}
