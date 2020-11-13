import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/main/matching/AutoMatchingTab.dart';
import 'package:playport_test/app/widget/MainMenuButton.dart';

import 'FriendSearchTab.dart';
import 'UserListTab.dart';

// ----------------------------------------
// メインページ
// ----------------------------------------
class MatchingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("playport"),
          actions: [
            MainMenuButton() // メインメニュー
          ],
        ),
        body: UserListTab(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.leak_add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AutoMatchingTab();
            }));
          },
        ),
      ),
    );
  }
}
