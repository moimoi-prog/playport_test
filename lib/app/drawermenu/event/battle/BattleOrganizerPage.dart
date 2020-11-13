import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:playport_test/app/page/main/event/page/EventOrganizerMenuPage.dart';
import 'package:playport_test/app/page/message/event/HeldEventMessageTabView.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/module/CommonModule.dart';
import 'package:playport_test/module/EventModule.dart';

// ----------------------------
// クラス名　: BattleOrganizerPage
// クラス概要: 大会主催者用ページ
// ----------------------------
class BattleOrganizerPage extends StatelessWidget {
  /* Battle */ final Battle battle;

  const BattleOrganizerPage({ // コンストラクタ
    Key key,
    this.battle
  }) : assert(battle != null), super(key: key);

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
                      return HeldEventMessageTabView(id: battle.id, title: battle.title);
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
            child: ListView(
              children: [
                // 大会内容を表示
                _message(context, "イベント名", battle.title),
                _message(context, "対象タイトル", battle.game),
                _message(context, "ルール", battle.rule),
                _message(context, "賞品", battle.prize),
                _message(context, "備考", battle.remarks),
                _message(context, "申込締切日時", getFormattedDate("yyyy/MM/dd", battle.deadLine)),
                _message(context, "開催日時", getFormattedDate("yyyy/MM/dd", battle.held)),
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
        }
    );
  }
}
