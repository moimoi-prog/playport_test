import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/message/event/HeldEventMessageTabView.dart';
import 'package:playport_test/app/page/message/event/JoinEventMessageTabView.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/state/messageTab/data/MessageDetail.dart';

// ------------------------------------
// 主催イベントメッセージ明細
// ------------------------------------
class HeldEventMessageDetail extends StatelessWidget {
  /* Messageデータ */ final MessageDetail message;

  HeldEventMessageDetail({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HeldEventMessageTabView(id: message.id, title: message.name);
              },
            ),
          );
        },
        child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: UserImageWidgetFromPath(path: message.image, radius: MediaQuery.of(context).size.width / 8, color: Colors.grey),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(message.name),
                      // Text("主催イベント", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  subtitle: Text(message.message.replaceAll("\r\n", " ").replaceAll("\n", " "), overflow: TextOverflow.ellipsis),
                )
              ],
            )),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: '固定',
          color: Colors.indigo,
          icon: Icons.push_pin,
          onTap: () {
            Fluttertoast.showToast(msg: "固定");
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '削除',
          color: Colors.pink,
          icon: Icons.restore_from_trash,
          onTap: () {
            Fluttertoast.showToast(msg: "削除");
          },
        ),
      ],
    );
  }
}
