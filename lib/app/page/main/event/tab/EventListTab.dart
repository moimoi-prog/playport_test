import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/drawermenu/event/EventHeldBottomSheet.dart';
import 'package:playport_test/app/drawermenu/event/battle/BattleDetailPage.dart';
import 'package:playport_test/app/drawermenu/event/meeting/MeetingDetailPage.dart';
import 'package:playport_test/app/widget/MainMenuButton.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/state/eventListTab/EventListTabNotifier.dart';
import 'package:playport_test/state/eventListTab/EventListTabState.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:provider/provider.dart';

class EventListTab extends StatelessWidget {
  /* 公認フラグ 　*/ final bool official;

  /* 大会フラグ 　*/
  final bool battle;

  /* オフ会フラグ */
  final bool meeting;

  final Key key = PageStorageKey<String>("EventListTab");

  EventListTab(
      { // コンストラクタ
      Key key,
      this.official = false, // 公認フラグ
      this.battle = false, // 大会フラグ
      this.meeting = false // オフ会フラグ
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("playport"),
        actions: [
          MainMenuButton()
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  // 2.1列目
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // 3.1.1行目
                        margin: const EdgeInsets.only(bottom: 4.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "条件で絞り込み"),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.search)
              ],
            )),
        Expanded(
          child: Provider.of<EventListTabState>(context, listen: true).when((events, controller) {
            return RefreshIndicator(
              onRefresh: () async {
                Provider.of<EventListTabNotifier>(context, listen: false).reload();
              },
              child: ListView.separated(
                  key: key,
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.0),
                  separatorBuilder: (BuildContext context, index) {
                    return Divider();
                  },
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    Event event = events[index];

                    if (event is Battle) {
                      bool requestFlag = event.uid != user.uid;
                      bool organizerFlag = event.uid == user.uid;

                      return _buildBattleListItem(
                        // Battle用Widgetを返却
                          context: context,
                          battle: event,
                          requestFlag: requestFlag,
                          organizerFlag: organizerFlag);
                    } else if (event is Meeting) {
                      bool requestFlag = event.uid != user.uid;
                      bool organizerFlag = event.uid == user.uid;

                      return _buildMeetingListItem(
                        // Meeting用Widgetを返却
                          context: context,
                          meeting: event,
                          requestFlag: requestFlag,
                          organizerFlag: organizerFlag);
                    }

                    return Text("未知");
                  }),
            );
          }, loading: () {
            return Center(child: CircularProgressIndicator());
          }),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add),
        onPressed: () {
          showEventHeldBottomSheet(context);
        },
      ),
    );
  }

  Widget _buildBattleListItem(
      {BuildContext context, // コンテキスト
      Battle battle, // Battleデータ
      bool requestFlag = false, // 参加者フラグ
      bool organizerFlag = false // 主催者フラグ
      }) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BattleDetailPage(
                battle: battle,
                requrstFlag: requestFlag,
                organizerFlag: organizerFlag,
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
                Text(
                    // イベント名
                    battle.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false),
                Text(
                  // イベント種別
                  "大会",
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

                // 賞品
                _rowWidget(context, "賞品", battle.prize),
              ],
            )),
      ),
    );
  }

  Widget _buildMeetingListItem(
      {BuildContext context, // コンテキスト
      Meeting meeting, // Meetingデータ
      bool requestFlag = false, // 参加者フラグ
      bool organizerFlag = false // 開催者フラグ
      }) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MeetingDetailPage(
                meeting: meeting,
                requrstFlag: requestFlag,
                organizerFlag: organizerFlag,
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
                Text(
                    // イベント名
                    meeting.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false),
                Text(
                  // イベント種別
                  "オフ会",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // ゲーム
                _rowWidget(context, "ゲーム", meeting.game),

                // 内容
                _rowWidget(context, "内容", meeting.content),
              ],
            )),
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
