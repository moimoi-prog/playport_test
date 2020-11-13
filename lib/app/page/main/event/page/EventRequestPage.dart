import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/main/event/widget/EventRequestWidget.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/data/Battle.dart';


class EventRequestPage extends StatelessWidget {
  /* イベントデータ */ final Event event;

  EventRequestPage({Key key, this.event}) : super(key: key);
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
          title: Text("参加申請者一覧"),
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance // イベントリクエストを取得
                    .collection(Strings.EVENTS)
                    .doc(id)
                    .collection(Strings.REQUESTS)
                    .where(Strings.STATUS, isEqualTo: ApplicationStatus.REQUEST)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> docs) {
                  if (!docs.hasData) {
                    return Text("申請者情報を取得中・・・");
                  }

                  if (docs.data.size == 0) {
                    return Text("申請者が存在しません");
                  }

                  return ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: docs.data.size,
                    itemBuilder: (context, index) => EventRequestWidget(event: event, request: docs.data.docs[index]),
                  );
                }),),
      ),
    );
  }
}
