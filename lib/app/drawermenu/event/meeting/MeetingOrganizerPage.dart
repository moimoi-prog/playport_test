import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:playport_test/app/page/main/event/page/EventOrganizerMenuPage.dart';
import 'package:playport_test/app/page/message/event/HeldEventMessageTabView.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/module/CommonModule.dart';

// ----------------------------
// クラス名　: MeetingOrganizerPage
// クラス概要: オフ会主催者用ページ
// ----------------------------
class MeetingOrganizerPage extends StatelessWidget {
  /* Meetingデータ */ final Meeting meeting;

  const MeetingOrganizerPage({ // コンストラクタ
    Key key,
    this.meeting
  }) : assert(meeting != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("イベント詳細"),
          actions: <Widget>[
            // チャットボタン
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HeldEventMessageTabView(id: meeting.id, title: meeting.title);
                    },
                  ),
                );
              },
            ),

            // 主催者メニュー
            _organizerButton(context)
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection(Strings.EVENTS).doc(meeting.id).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                  if (!doc.hasData) {
                    return Text("イベントデータを取得中");
                  }

                  if (!doc.data.exists) {
                    return Text("イベントデータが存在しませんでした");
                  }

                  return ListView(
                    children: [
                      // 大会内容を表示
                      _message(context, "イベント名", meeting.title),
                      _message(context, "対象タイトル", meeting.title),
                      _message(context, "内容", meeting.content),
                      _message(context, "備考", meeting.remarks),
                      _message(context, "申込締切日時", getFormattedDate("yyyy/MM/dd", meeting.deadLine)),
                      _message(context, "開催日時", getFormattedDate("yyyy/MM/dd", meeting.held)),
                    ],
                  );
                }
            )
        ),
      ),
    );
  }

  // 内容を表示
  Widget _message(BuildContext context, String type, String str) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(type),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Text(
                str,
              )),
        ),
      ],
    );
  }
  
  // 開催者用ボタン(開催者メニュー表示)を表示
  Widget _organizerButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return EventOrganizerMenuPage(event: meeting);
              },
            ),
          );
        }
    );
  }
}
