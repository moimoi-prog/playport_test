import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/bottmnsheet/MessageOperationBottomSheet.dart';
import 'package:playport_test/app/drawermenu/event/meeting/MeetingHeldPage.dart';
import 'package:playport_test/app/page/main/event/bottomsheet/EventDeleteBottmnSheet.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/state/battleHeldPage/BattleHeldNotifier.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/state/meetingHeldPage/MeetingHeldNotifier.dart';
import 'package:provider/provider.dart';

import '../../../../drawermenu/event/battle/BattleHeldPage.dart';
import 'EventApprovalPage.dart';
import 'EventRequestPage.dart';

class EventOrganizerMenuPage extends StatelessWidget {
  /* イベントデータ */ final Event event;

  EventOrganizerMenuPage({Key key, this.event})
      : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("主催者メニュー"),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                // 大会要項変更ボタン
                Card(
                  child: _editButton(context, event)
                ),

                // 参加者一覧を表示
                Card(
                  child: ListTile(
                      title: Text("参加者一覧を表示"),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return EventApprovalPage(
                                event: event,
                              );
                            },
                          ),
                        );
                      }),
                ),

                // 参加申請一覧を表示
                Card(
                  child: ListTile(
                      title: Text("参加申請一覧を表示"),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return EventRequestPage(
                                event: event,
                              );
                            },
                          ),
                        );
                      }),
                ),

                // 大会中止ボタン
                Card(
                  child: ListTile(
                      title: Text('大会を中止する'),
                      onTap: () {
                        // 大会データを削除する
                        showEventDeleteBottmnSheet(context, event);
                      }),
                ),
              ],
            ),
          )),
    );
  }

  Widget _editButton(BuildContext context, Event event) {
    if (event is Battle) {
      return _battleEditButton(context, event);
    } else if (event is Meeting) {
      return _meetingEditButton(context, event);
    }
  }

  Widget _battleEditButton(BuildContext context, Battle battle) {
    return ListTile(
        title: Text('大会要項を変更'),
        onTap: () {
          Provider.of<BattleHeldStateNotifier>(context, listen: false).readBattle(battle);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BattleHeldPage(
                  battle: battle,
                );
              },
            ),
          );
        });
  }

  Widget _meetingEditButton(BuildContext context, Meeting meeting) {
    return ListTile(
        title: Text('大会要項を変更'),
        onTap: () {
          Provider.of<MeetingHeldStateNotifier>(context, listen: false).readMeeting(meeting);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MeetingHeldPage(
                  meeting: meeting,
                );
              },
            ),
          );
        });
  }
}
