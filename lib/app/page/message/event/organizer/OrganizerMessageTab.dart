import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

import 'OrganizerDetailSearchWidget.dart';
import 'OrganizerDetailsWidget.dart';
import 'OrganizerSendWidget.dart';


class OrganizerMessagesTab extends StatelessWidget {
  final String id;

  OrganizerMessagesTab({Key key, this.id}) : super(key: key);

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
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.JOIN_EVENTS).doc(id).get(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> userEventDoc) {
                  if (!userEventDoc.hasData) {
                    return Text("");
                  }

                  if (!userEventDoc.data.exists) {
                    return Text("イベント情報を取得できませんでした");
                  }

                  if (userEventDoc.data.data()[Strings.STATUS] == ApplicationStatus.REJECT) {
                    return Text("このイベントへの参加は承認されませんでした");
                  }

                  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    // トーク内容検索用Widget
                    OrganizerDetailSearchWidget(),

                    // メッセージ内容表示用Widget
                    OrganizerDetailsWidget(id: userEventDoc.data.data()[Strings.INQUIRY]),

                    // メッセージ送信用Widget
                    OrganizerSendWidget(id: userEventDoc.data.data()[Strings.INQUIRY]),
                  ]);
                }
              )),
        ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
      ),
    );
  }
}
