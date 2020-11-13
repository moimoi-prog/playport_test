import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/main/event/widget/EventApprovalWidget.dart';
import 'package:playport_test/app/page/main/event/widget/EventRequestWidget.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/data/Battle.dart';


class EventApprovalPage extends StatelessWidget {
  /* イベントデータ */ final Event event;

  EventApprovalPage({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String id;
    if (event is Battle) {
      Battle battle = event;
      id = battle.id;

    } else if (event is Meeting) {
      Meeting meeting = event;
      id = meeting.id;

    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("参加者一覧"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance // イベントリクエストを取得
                  .collection(Strings.EVENTS)
                  .doc(id)
                  .collection(Strings.REQUESTS)
                  .where(Strings.STATUS, isEqualTo: ApplicationStatus.APPROVAL)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> docs) {
                if (!docs.hasData) {
                  return Text("参加者を取得中・・・");
                }

                if (docs.data.size == 0) {
                  return Text("参加者が存在しません");
                }

                return ListView.separated(
                  padding: EdgeInsets.only(top: 10.0),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: docs.data.size,
                  itemBuilder: (context, index) => EventApprovalWidget(event: event, request: docs.data.docs[index]),
                );
              }),),
      ),
    );
  }
}
