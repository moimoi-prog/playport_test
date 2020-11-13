import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/widget/MainMenuButton.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/state/shoutListTab/ShoutListNotifier.dart';
import 'package:playport_test/state/shoutListTab/ShoutListState.dart';
import 'package:provider/provider.dart';

import 'ShoutDetailWidget.dart';
import 'ShoutAddPage.dart';

class ShoutTab extends StatelessWidget {
  final List<Tab> myTabs = [
    Tab(text: "フレンド"),
    Tab(text: "ワールド"),
    Tab(text: "人気"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("playport"),
          bottom: TabBar(
            isScrollable: true,
            tabs: myTabs,
          ),
          actions: [
            MainMenuButton()
          ],
        ),
        body: TabBarView(
          children: [
            _friendShoutTab(context),
            _worldShoutTab(context),
            _popularShoutTab(context),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ShoutAddPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  // ----------------------------------------
  // フレンドシャウト
  // ----------------------------------------
  Widget _friendShoutTab(BuildContext context) {
    return Provider.of<ShoutListState>(context, listen: true).when((shouts) {
      return RefreshIndicator(
          onRefresh: () async {
            Provider.of<ShoutListNotifier>(context, listen: false).reloadShouts();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: shouts.length,
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return ShoutDetailWidget(shout: shouts[index]);
            },
          ));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }

  // ----------------------------------------
  // ワールドシャウト
  // ----------------------------------------
  Widget _worldShoutTab(BuildContext context) {
    return Provider.of<ShoutListState>(context, listen: true).when((shouts) {
      return RefreshIndicator(
          onRefresh: () async {
            Provider.of<ShoutListNotifier>(context, listen: false).reloadShouts();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: shouts.length,
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return ShoutDetailWidget(shout: shouts[index]);
            },
          ));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }

  // ----------------------------------------
  // 人気シャウト
  // ----------------------------------------
  Widget _popularShoutTab(BuildContext context) {
    return Provider.of<ShoutListState>(context, listen: true).when((shouts) {
      return RefreshIndicator(
          onRefresh: () async {
            Provider.of<ShoutListNotifier>(context, listen: false).reloadShouts();
          },
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10.0),
            itemCount: shouts.length,
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return ShoutDetailWidget(shout: shouts[index]);
            },
          ));
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
