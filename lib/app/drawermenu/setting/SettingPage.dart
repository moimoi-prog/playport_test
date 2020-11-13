import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'EventSettingPage.dart';
import 'MatchingSettingPage.dart';
import 'MessageSettingPage.dart';


class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
          appBar: AppBar(
            title: Text("設定"),
          ),
          body:     SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Text('アカウント設定'),
                    onTap: () {
                      Fluttertoast.showToast(msg: "クリックしました。");
                    }),
                ListTile(
                    title: Text('セキュリティ設定'),
                    onTap: () {
                      Fluttertoast.showToast(msg: "クリックしました。");
                    }),

                ListTile(
                    title: Text('マッチング設定'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MatchingSettingPage();
                          },
                        ),
                      );
                    }),
                ListTile(
                    title: Text('メッセージ設定'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MessageSettingPage();
                          },
                        ),
                      );                  }),
                ListTile(
                    title: Text('イベント設定'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EventSettingPage();
                          },
                        ),
                      );
                    }),
                ListTile(
                    title: Text('戻る'),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          )
      );
  }
}