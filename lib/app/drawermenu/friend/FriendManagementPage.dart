import 'package:flutter/material.dart';
import 'package:playport_test/app/drawermenu/friend/FriendRequestTab.dart';
import 'package:playport_test/app/page/main/matching/AutoMatchingTab.dart';

import 'FriendListTab.dart';



// ----------------------------------------
// メインページ
// ----------------------------------------
class FriendManagementPage extends StatefulWidget {
  _FriendManagementTabForm createState() => _FriendManagementTabForm();
}

// ----------------------------------------
// メインステータス
// ----------------------------------------
class _FriendManagementTabForm extends State<FriendManagementPage> with SingleTickerProviderStateMixin {

  final List<Tab> tabs = <Tab>[
    Tab(text: "フレンドリスト"),
    Tab(text: '申請リスト'),
  ];

  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
            title: Text("フレンド管理"),
            bottom: TabBar(
              tabs: tabs,
              controller: _tabController,
            ),
          ),
          body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                FriendListTab(),
                FriendRequestTab()
              ]
          )
      ),
    );
  }
}
