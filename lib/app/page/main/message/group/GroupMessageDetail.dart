import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/bottmnsheet/MessageOperationBottomSheet.dart';
import 'package:playport_test/app/page/message/group/GroupPage.dart';
import 'package:playport_test/app/page/message/talk/TalkPage.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/RoomType.dart';
import 'package:playport_test/firebase/firestore/GroupModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';
import 'package:playport_test/module/MessageModule.dart';
import 'package:playport_test/state/messageTab/data/Message.dart';
import 'package:playport_test/state/messageTab/data/MessageDetail.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabNotifier.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabState.dart';
import 'package:provider/provider.dart';

// ------------------------------------
// 記事明細パーツ
// ------------------------------------
class GroupMessageDetail extends StatelessWidget {
  /* Message情報 */ final MessageDetail message;

  GroupMessageDetail({Key key, this.message}) : super(key: key);

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
          readGroup(message.id);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return GroupPage( // グループページへ遷移
                    id: message.id,
                    name: message.name,
                    create: message.create
                );
              },
            ),
          );
        },
        // onLongPress: () {
        //   showMessageOperationBottomSheet(context, document);
        // },
        child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                    leading: GroupDetailImageWidget(path: message.image, radius: MediaQuery.of(context).size.width / 8, color: Colors.grey),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          message.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Text(
                        //   "グループ",
                        //   style: TextStyle(color: Colors.grey),
                        //   overflow: TextOverflow.ellipsis,
                        // )
                      ],
                    ),
                    // subtitle: Text(message.message.replaceAll("\r\n", " ").replaceAll("\n", " "), overflow: TextOverflow.ellipsis),
                    subtitle: StreamBuilder(
                      stream: FirebaseFirestore.instance // メッセージ一覧を取得
                          .collection(Strings.GROUPS)
                          .doc(message.id)
                          .collection(Strings.MESSAGES)
                          .where(Strings.TIMESTAMP, isGreaterThanOrEqualTo: message.create)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> messages) {
                        if (!messages.hasData || messages.data.size == 0) {
                          return Text("");
                        }

                        return Text(getMessage(messages.data.docs).replaceAll("\r\n", " ").replaceAll("\n", " "), overflow: TextOverflow.ellipsis);
                      },
                    ),
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
            Fluttertoast.showToast(msg: "削除");
          },
        ),
      ],
    );
  }
}
