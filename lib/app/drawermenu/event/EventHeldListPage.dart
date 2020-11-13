import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/drawermenu/event/battle/BattleDetailPage.dart';
import 'package:playport_test/app/drawermenu/event/battle/BattleHeldPage.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/state/eventHeldListPage/EventHeldListState.dart';
import 'package:provider/provider.dart';

import 'battle/BattleOrganizerPage.dart';
import 'EventHeldBottomSheet.dart';
import 'meeting/MeetingOrganizerPage.dart';

class EventHeldListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("主催イベント一覧"),
        ),
        body: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Provider.of<EventHeldListState>(context, listen: true).when((events) {
              return ListView.separated(
                  padding: EdgeInsets.only(top: 10.0),
                  separatorBuilder: (BuildContext context, index) {
                    return Divider();
                  },
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    Event event = events[index];

                    if (event is Battle) {
                      return _buildBattleListItem(
                        // Battle用Widgetを返却
                          context: context,
                          battle: event
                      );
                    } else if (event is Meeting) {
                      return _buildMeetingListItem(
                        // Meeting用Widgetを返却
                          context: context,
                          meeting: event
                      );
                    }

                    return Text("未知");
                  });
            }, loading: () {
              return Center(child: CircularProgressIndicator());
            }),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showEventHeldBottomSheet(context);
            },
          ),
        ),
      )
    );
  }

  Widget _buildBattleListItem({ // battleアイテム
    BuildContext context,
    Battle battle
  }) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BattleOrganizerPage(battle: battle);
            },
          ),
        );
      },
      child: Container(
        child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text( // イベントタイトル
                    battle.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false
                ),
                Text( // サブタイトル
                  "開催状況を表示",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // ゲーム
                _rowWidget(context, "ゲーム", battle.game),

                // ルール
                _rowWidget(context, "ルール", battle.rule),
              ],
            )
        ),
      ),
    );
  }

  Widget _buildMeetingListItem({ // Meetingアイテム
    BuildContext context,
    Meeting meeting
  }) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MeetingOrganizerPage(meeting: meeting);
            },
          ),
        );
      },
      child: Container(
        child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text( // イベントタイトル
                    meeting.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false
                ),
                Text( // サブタイトル
                  "開催状況を表示",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // ゲーム
                _rowWidget(context, "ゲーム", meeting.game),

                // ルール
               _rowWidget(context, "内容", meeting.content),
              ],
            )
        ),
      ),
    );
  }

  // 行
  Widget _rowWidget(BuildContext context, String type, String data) {
    data = data.replaceAll("\r\n", " ").replaceAll("\n", " ");

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Container(
        child: Text("$type: $data", maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false),
      ),
    );
  }

}
