import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/module/EventModule.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/state/eventJoinListPage/EventJoinListState.dart';
import 'package:provider/provider.dart';

import 'EventJoinWidget.dart';
import 'battle/BattleDetailPage.dart';
import 'meeting/MeetingDetailPage.dart';

class EventJoinListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("参加イベント一覧"),
      ),
      body: Provider.of<EventJoinListState>(context, listen: true).when((events, status) {
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
                    battle: event,
                    status: status[index]);
              } else if (event is Meeting) {
                return _buildMeetingListItem(
                    // Meeting用Widgetを返却
                    context: context,
                    meeting: event,
                    status: status[index]);
              }

              return Text("未知");
            });
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    ));
  }

  Widget _buildBattleListItem({BuildContext context, Battle battle, String status}) {
    String subtitle;

    switch (status) {
      case ApplicationStatus.REQUEST:
        subtitle = "申請送信済み";
        break;

      case ApplicationStatus.APPROVAL:
        subtitle = "申請承認済み";
        break;

      case ApplicationStatus.REJECT:
        subtitle = "拒否";
        break;
    }

    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BattleDetailPage(
                battle: battle,
                requrstFlag: true,
              );
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
                  subtitle,
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

  Widget _buildMeetingListItem({BuildContext context, Meeting meeting, String status}) {
    String subtitle;

    switch (status) {
      case ApplicationStatus.REQUEST:
        subtitle = "申請送信済み";
        break;

      case ApplicationStatus.APPROVAL:
        subtitle = "申請承認済み";
        break;

      case ApplicationStatus.REJECT:
        subtitle = "拒否";
        break;
    }

    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MeetingDetailPage(
                meeting: meeting,
                requrstFlag: true,
              );
            },
          ),
        );
      },
      child: Container(
        child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(// イベントタイトル
                    meeting.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false
                ),
                Text( // サブタイトル
                    subtitle,
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
