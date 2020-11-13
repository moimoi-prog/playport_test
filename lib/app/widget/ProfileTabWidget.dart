import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../page/profile/GameListView.dart';
import '../page/profile/PerformanceListView.dart';
import '../page/profile/PostListView.dart';

// ------------------------------------
// タブパーツ
// ------------------------------------
class ProfileTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
              tabs: [
                Tab(text: "ゲーム", icon: Icon(Icons.videogame_asset)),
                Tab(text: "投稿", icon: Icon(Icons.storage)),
                Tab(text: "実績", icon: Icon(Icons.flag)),
              ],
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              GameListView(),
              PostListView(),
              PerformanceListView(),
            ]),
          ),
        ],
      ),
    );
  }
}
