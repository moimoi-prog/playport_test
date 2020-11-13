import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/common/widget/StickyTabBar.dart';

import 'GameListView.dart';
import 'PostListView.dart';
import 'ProfileDataWidget.dart';
import 'ProfileMessageWidget.dart';

// ------------------------------------
// プロフィールページ
// ------------------------------------
class ProfilePage extends StatelessWidget {
  /* uid     */ final String uid;

  const ProfilePage({Key key, this.uid}) : assert(uid != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    /* 画面の横 */
    double windowWidth = MediaQuery.of(context).size.width;

    // // ドキュメントが引数で渡されていない場合、取得する
    // if (document == null) {
    //   document = FirebaseFirestore.instance.collection("users").doc(uid).;
    // }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("プロフィール"), elevation: 0.0),
        body: StickyTabBar(
          tabHeader: [
            ProfileDataWidget(width: windowWidth, uid: uid),
            ProfileMessageWidget(uid: uid),
          ],
          tabBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.videogame_asset)),
              Tab(icon: Icon(Icons.storage)),
              // Tab(icon: Icon(Icons.flag)),
            ],
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,

          ),
          tabBarView: TabBarView(children: [
            GameListView(uid: uid),
            PostListView(uid: uid),
            // PerformanceListView(document: document),
          ]),
        )
      )
    );
  }
}