import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/main/shout/ShoutAddPage.dart';
import 'package:playport_test/app/page/main/shout/ShoutDetailWidget.dart';
import 'package:playport_test/state/shoutListTab/ShoutListNotifier.dart';
import 'package:playport_test/state/shoutListTab/ShoutListState.dart';
import 'package:provider/provider.dart';

// ----------------------------------------
// シャウトページ
// ----------------------------------------
class ToolTab extends StatelessWidget {
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
              itemBuilder: (context, index) => Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ShoutDetailWidget(shout: shouts[index]),
                actions: <Widget>[
                  IconSlideAction(
                    caption: '共有',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => Fluttertoast.showToast(msg: "共有"),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: '通報',
                    color: Colors.red,
                    icon: Icons.report_problem,
                    onTap: () => Fluttertoast.showToast(msg: "通報"),
                  ),
                ],
              ))
      );
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
              itemBuilder: (context, index) => Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ShoutDetailWidget(shout: shouts[index]),
                actions: <Widget>[
                  IconSlideAction(
                    caption: '共有',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => Fluttertoast.showToast(msg: "共有"),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: '通報',
                    color: Colors.red,
                    icon: Icons.report_problem,
                    onTap: () => Fluttertoast.showToast(msg: "通報"),
                  ),
                ],
              ))
      );
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
              itemBuilder: (context, index) => Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ShoutDetailWidget(shout: shouts[index]),
                actions: <Widget>[
                  IconSlideAction(
                    caption: '共有',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => Fluttertoast.showToast(msg: "共有"),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: '通報',
                    color: Colors.red,
                    icon: Icons.report_problem,
                    onTap: () => Fluttertoast.showToast(msg: "通報"),
                  ),
                ],
              ))
      );
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}
