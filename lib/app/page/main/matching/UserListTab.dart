import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/state/userListTab/UserListTabNotifier.dart';
import 'package:playport_test/state/userListTab/UserListTabState.dart';
import 'package:provider/provider.dart';

import 'FriendButtons.dart';
import 'MatchingListWidget.dart';

class UserListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        TextField(
                          decoration: InputDecoration(hintText: "条件で絞り込み"),
                        )
                      ],
                    ),
                  ),

                  // zoom_inでもいいかも
                  IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: "絞り込み");
                    },
                    icon: Icon(Icons.filter_list),
                  )
                ],
              ),
            ),
        Expanded(
            child: user == null
                ? Text("ログインしてください")
                : Provider.of<UserListTabState>(context, listen: true).when((matchings) {
                    return RefreshIndicator(
                        onRefresh: () async {
                          Provider.of<UserListTabNotifier>(context, listen: false).reload();
                        },
                        child: ListView.separated(
                            itemCount: matchings.length,
                            separatorBuilder: (BuildContext context, index) {
                              return Divider();
                            },
                            itemBuilder: (context, index) => Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: MatchingListWidget(matching: matchings[index]),
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
                                )));
                  }, loading: () {
                    return Center(child: CircularProgressIndicator());
                  })),
      ])),
    );
  }
}
