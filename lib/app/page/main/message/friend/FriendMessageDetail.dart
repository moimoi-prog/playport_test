import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/bottmnsheet/MessageOperationBottomSheet.dart';
import 'package:playport_test/app/page/message/talk/TalkPage.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/RoomType.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/module/MessageModule.dart';
import 'package:playport_test/state/messageTab/data/MessageDetail.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabNotifier.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabState.dart';
import 'package:provider/provider.dart';

// ------------------------------------
// クラス名　: FriendMessageDetail
// クラス概要: MessageTabに表示するフレンドメッセージ
// ------------------------------------
class FriendMessageDetail extends StatelessWidget {
  /* Messageデータ */ final MessageDetail message;

  FriendMessageDetail({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () async {
          // タイムスタンプを生成
          DateTime now = DateTime.now();

          // 既読をつける
          readTalk(message.id, now);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TalkPage( // トーク用ページ
                    id: message.id,
                    image: message.image,
                    title: message.name,
                    opponent: message.uid,
                    create: message.create
                );
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
                        Text(
                          message.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(
                        //   "フレンド",
                        //   style: TextStyle(color: Colors.grey),
                        //   overflow: TextOverflow.ellipsis,
                        // )
                      ],
                    ),
                    subtitle: Text(message.message.replaceAll("\r\n", " ").replaceAll("\n", " "), overflow: TextOverflow.ellipsis),
                    trailing: Provider.of<MessageTabState>(context, listen: true).when((messages) {
                      bool flag = false;
                      messages.forEach((element) {
                        if (element.id == message.id) {
                          flag = (element.read.toDate().isAfter(element.update.toDate()));
                        }
                      });

                      if (flag) {
                        return null;
                      } else {
                        return Icon(Icons.brightness_1, color: Theme.of(context).accentColor);
                      }
                    }, loading: () {
                      return null;
                    }))
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
            deleteTalk(message.id);
          },
        ),
      ],
    );
  }
}
