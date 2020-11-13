import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/message/event/participant/ParticipantMessageTab.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

import 'organizer/OrganizerMessageTab.dart';
import 'whole/WholeMessageTab.dart';


// ----------------------------------------
// 主催者メッセージタブビュー
// ----------------------------------------
class HeldEventMessageTabView extends StatefulWidget {
  final String id;
  final String title;

  const HeldEventMessageTabView({ // コンストラクタ
    Key key, 
    this.id,
    this.title
  }) : super(key: key);

  _HeldEventMessageTabForm createState() => _HeldEventMessageTabForm();
}

// ----------------------------------------
// メッセージタブステータス
// ----------------------------------------
class _HeldEventMessageTabForm extends State<HeldEventMessageTabView> with SingleTickerProviderStateMixin {
  /* コントローラー */ TabController _tabController;

  // タブヘッダー
  final List<Tab> tabHeader = <Tab>[
    Tab(text: "全体"),
    Tab(text: '参加者'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabHeader.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              bottom: TabBar(
                controller: _tabController,
                tabs: tabHeader,
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Fluttertoast.showToast(msg: "主催イベントメニューを表示しました");
                    }
                )
              ],
            ),
            body: user == null
                ? Text("ログインしてください")
                : TabBarView(
                controller: _tabController,
                children: <Widget>[
                  WholeMessagesTab(id: widget.id),
                  ParticipantMessagesTab(id: widget.id),
                ]
            )
        )
    );
  }
}
