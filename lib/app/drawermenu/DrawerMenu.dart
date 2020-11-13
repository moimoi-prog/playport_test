import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/dialog/LoadingDialog.dart';
import 'package:playport_test/app/drawermenu/setting/SettingPage.dart';
import 'package:playport_test/app/page/RequestPage.dart';
import 'package:playport_test/app/page/friendList/FriendListPage.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

import 'event/EventManagementPage.dart';
import 'friend/FriendManagementPage.dart';

Widget drawerMenu(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'メニュー',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          title: Text('マイページ'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProfilePage(uid: user.uid);
                },
              ),
            );
          },
        ),
        ListTile(
          title: Text('フレンド管理'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FriendManagementPage();
                },
              ),
            );
          },
        ),
        ListTile(
          title: Text('イベント管理'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return EventManagementPage();
                },
              ),
            );
          },
        ),
        ListTile(
          title: Text('設定'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SettingPage();
                },
              ),
            );
          },
        ),
        ListTile(
          title: user == null ? Text('ログイン') : Text('ログアウト'),
          onTap: () async {
            if (user == null) {
              Navigator.pushReplacementNamed(context, "/login");
            } else {
              showLoadingDialog(context);
              await userLogout();
              await signOutWithGoogle();
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: "ログアウトしました。");
              Navigator.pushReplacementNamed(context, "/login");
            }
          },
        ),
      ],
    ),
  );
}
