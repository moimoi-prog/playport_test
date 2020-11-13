import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/message/event/JoinEventMessageTabView.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/module/CommonModule.dart';
import 'package:playport_test/data/Battle.dart';

import '../../../page/main/event/page/EventOrganizerMenuPage.dart';

class BattleDetailPage extends StatelessWidget {
  /* イzZZデータ */ final Battle battle;
  final bool requrstFlag;
  final bool organizerFlag;
  final bool participantFlag;

  const BattleDetailPage({ // コンストラクタ
    Key key,
    this.battle,
    this.requrstFlag = false,
    this.organizerFlag = false,
    this.participantFlag = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("イベント詳細"),
          actions: <Widget>[
            // // チャットボタン
            // IconButton(
            //   ZZ
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return EventMessageTabView(document: eventDoc);
            //         },
            //       ),
            //     );
            //   },
            // ),

            // 主催者メニュー
            if (organizerFlag) _organizerButton(context)
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                // 大会内容を表示
                _message(context, "イベント名", battle.title),
                _message(context, "対象タイトル", battle.game),
                _message(context, "ルール", battle.rule),
                _message(context, "賞品", battle.rule),
                _message(context, "備考", battle.remarks),
                _message(context, "申込締切日時", getFormattedDate("yyyy/MM/dd", battle.deadLine)),
                _message(context, "開催日時", getFormattedDate("yyyy/MM/dd", battle.held)),
                _organizer(),
                if (requrstFlag) _requestButton(context),
                if (participantFlag) _participantButton(context)
              ],
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

  // 主催者を表示
  Widget _organizer() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FutureBuilder(
            future: FirebaseFirestore.instance.collection(Strings.USERS).doc(battle.uid).get(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
              if (!doc.hasData) {
                return Text("");
              }

              if (!doc.data.exists) {
                return Text("主催者名を取得できませんでした");
              }

              return InkWell(
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfilePage(uid: doc.data.data()[Strings.UID]);
                        },
                      ),
                    );
                  },
                  child: Text("主催者: " + doc.data.data()[Strings.NAME]));
            },
          )
        ],
      ),
    );
  }

  // リクエスト用ボタンを表示
  Widget _requestButton(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.JOIN_EVENTS).doc(battle.id).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
        if (!doc.hasData) {
          return RaisedButton(
            child: Text("取得中・・・"),
          );
        }

        // 未申請
        if (!doc.data.exists) {
          return RaisedButton(
            child: Text("参加申請"),
            onPressed: () async {
              await sendEventRequest(battle.id);
            },
          );
        }

        switch(doc.data.data()[Strings.STATUS]) {
          case ApplicationStatus.REQUEST:
            // 申請承認待ちの場合
            return RaisedButton(
              child: Text("申請承認待ちです"),
            );
            break;

          case ApplicationStatus.APPROVAL:
            return RaisedButton(
              // 承認されている場合
              child: Text("申請承認されています(メッセージを表示)"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return JoinEventMessageTabView(id: battle.id, title: battle.title);
                    },
                  ),
                );
              },
            );
            break;

          case ApplicationStatus.REJECT:
            // 拒否されている場合
            return RaisedButton(
              child: Text("申請拒否されました"),
            );
            break;
        }

        return Text("");
      }
    );
  }

  // 参加者用ボタン(参加申請取り消し)を表示
  Widget _participantButton(BuildContext context) {
    return RaisedButton(
      child: Text("申請取消"),
      onPressed: () async {
        await cancelEventRequest(battle.id);
        Navigator.of(context).pop();
      },
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
                return EventOrganizerMenuPage(event: battle);
              },
            ),
          );
        });
  }
}
