import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/createGroup/CreateGroupPage.dart';
import 'package:playport_test/app/page/main/message/friend/FriendMessageDetail.dart';
import 'package:playport_test/app/widget/MainMenuButton.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/state/createGroupPage/CreateGroupNotifier.dart';
import 'package:playport_test/state/messageTab/data/Message.dart';
import 'package:playport_test/state/messageTab/data/MessageDetail.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabState.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessagesTabBlocProvider.dart';
import 'package:provider/provider.dart';

import 'group/GroupMessageDetail.dart';
import 'heldEvent/HeldEventMessageDetail.dart';
import 'joinEvent/JoinEventMessageDetail.dart';

class MessageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = MessagesTabBlocProvider.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("playport"),
          actions: [
            MainMenuButton()
          ],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  // 2.1列目
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(hintText: "条件で絞り込み"),
                      )
                    ],
                  ),
                ),

                // zoom_inでもいいかも
                IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "絞り込み");
                  },
                  icon: Icon(Icons.filter_list),
                )
              ],
            ),
          ),
          Expanded(
              child: Provider.of<MessageTabState>(context, listen: true).when((messages) {
            return ListView.separated(
                padding: EdgeInsets.all(5.0),
                separatorBuilder: (BuildContext context, index) {
                  return Divider();
                },
                itemCount: messages.length,
                itemBuilder: (context, index) => _buildMessageDetailWidget(message: messages[index]));
          }, loading: () {
            return Center(child: CircularProgressIndicator());
          })),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Provider.of<CreateGroupNotifier>(context, listen: false).reset();
            Provider.of<CreateGroupNotifier>(context, listen: false).setFriends();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CreateGroupPage();
            }));
          },
        ),
      ),
    );
  }

  Widget _buildMessageDetailWidget({MessageDetail message}) {
    switch (message.type) {
      case Strings.TALK:
        return FriendMessageDetail(message: message);
        break;

      case Strings.GROUP:
        return GroupMessageDetail(message: message);
        break;

      case Strings.HELD_EVENTS:
        return HeldEventMessageDetail(message: message);
        break;

      case Strings.JOIN_EVENTS:
        return JoinEventMessageDetail(message: message);
        break;

      default:
        return Text("未知");
        break;
    }
  }
}
