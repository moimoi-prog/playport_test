import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/module/EventModule.dart';

import 'battle/BattleDetailPage.dart';

// ------------------------------------
// 記事明細パーツ
// ------------------------------------
class EventJoinWidget extends StatelessWidget {
  final DocumentSnapshot doc;
  final String status;

  const EventJoinWidget({Key key, this.doc, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String subtitle;

    switch (status) {
      case ApplicationStatus.REQUEST:
        subtitle = "申請送信済み";
        break;

      case ApplicationStatus.APPROVAL:
        subtitle = "承認";
        break;

      case ApplicationStatus.REJECT:
        subtitle = "拒否";
        break;
    }

    return InkWell(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return BattleDetailPage(battle: createBattle(doc), participantFlag: true,);
            },
          ),
        );
      },
      child: Card(
        child: ListTile(
            title: Text(doc.data()[Strings.TITLE], maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false),
            subtitle: Text(subtitle)
        ),
      ),
    );
  }

  // 行
  Widget _rowWidget(BuildContext context, String type, String data) {
    data = data.replaceAll("\r\n", " ").replaceAll("\n", " ");

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Container(
        child: Text("$type: $data", maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false),
      ),
    );
  }
}
