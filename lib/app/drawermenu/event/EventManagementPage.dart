import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'EventHeldListPage.dart';
import 'EventJoinListPage.dart';

class EventManagementPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("イベント管理"),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    title: Text('主催イベント一覧'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EventHeldListPage();
                          },
                        ),
                      );
                    }),
                ListTile(
                    title: Text('参加イベント一覧'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return EventJoinListPage();
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
      ),
    );
  }
}