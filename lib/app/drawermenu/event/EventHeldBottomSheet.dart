import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/drawermenu/event/battle/BattleHeldPage.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';

import 'meeting/MeetingHeldPage.dart';

void showEventHeldBottomSheet(BuildContext context) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("大会を開催"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BattleHeldPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text("オフ会を開催"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return MeetingHeldPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
                title: Text('キャンセル', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      );
    },
  );
}
