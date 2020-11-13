import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';

import 'organizer/OrganizerMessageTab.dart';
import 'whole/WholeMessageTab.dart';


// ----------------------------------------
// 参加者メッセージタブビュー
// ----------------------------------------
class JoinEventMessageTabView extends StatefulWidget {
  final String id;
  final String title;

  const JoinEventMessageTabView({
    Key key, this.id, this.title
  }) : super(key: key);

  _JoinEventMessageTabForm createState() => _JoinEventMessageTabForm();
}

// ----------------------------------------
// メッセージタブステータス
// ----------------------------------------
class _JoinEventMessageTabForm extends State<JoinEventMessageTabView> with SingleTickerProviderStateMixin {
  /* コントローラー */ TabController _tabController;

  // タブヘッダー
  final List<Tab> tabHeader = <Tab>[
    Tab(text: "全体"),
    Tab(text: '運営者'),
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
                      Fluttertoast.showToast(msg: "参加イベントメニューを表示しました");
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
                  OrganizerMessagesTab(id: widget.id),
                ]
            )
        )
    );
  }
}
