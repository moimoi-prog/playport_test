import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/state/eventHeldListPage/EventHeldListNotifier.dart';
import 'package:playport_test/state/eventListTab/EventListTabNotifier.dart';
import 'package:provider/provider.dart';

void showEventDeleteBottmnSheet(BuildContext context, Event event) async {
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      String id;

      if (event is Battle) {
        Battle battle = event;
        id = battle.id;
      } else if (event is Meeting) {
        Meeting meeting = event;
        id = meeting.id;
      }

      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("中止しますか?"),
            ),
            ListTile(
                title: Text('確定', style: TextStyle(color: Colors.blue)),
                onTap: () async {
                  await deleteEvent(id);
                  Provider.of<EventListTabNotifier>(context, listen: false).reload();
                  Provider.of<EventHeldListNotifier>(context, listen: false).reload();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(msg: "中止しました。");
                }),
            ListTile(
                title: Text('キャンセル', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.of(context).pop(2);
                }),
          ],
        ),
      );
    },
  );
}
