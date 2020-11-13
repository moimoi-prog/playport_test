import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/app/page/message/ImageDetailWidget.dart';
import 'package:playport_test/app/page/message/InfoDetailWidget.dart';
import 'package:playport_test/app/page/message/TextDetailWidget.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/app/widget/UserNameWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

class MessageRowWidget extends StatelessWidget {
  final DocumentSnapshot document;

  MessageRowWidget({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* 投稿者フラグ 　　　*/ bool myMessage;
    /* キー            */ Key key = Key(document.id);

    // 投稿者を判定
    if (user.uid == document.data()[Strings.UID]) {
      myMessage = true;
    } else {
      myMessage = false;
    }

    // infoの場合、infoを返す
    if (document.data()[Strings.TYPE] == Strings.INFO) {
      return Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[InfoDetailWidget(document: document)],
      );
    }

    // メッセージを表示
    return Row(
      key: key,
      mainAxisAlignment: myMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (!myMessage) InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(uid: document.data()[Strings.UID]);
                    }
                )
            );
          },
          child: UserImageWidget(uid: document.data()[Strings.UID], radius: MediaQuery.of(context).size.width / 10, color: Colors.grey),
        ),
        if (document.data()[Strings.TYPE] == Strings.TEXT)
          Column(
            crossAxisAlignment: myMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[TextDetailWidget(document: document), UserNameWidget(uid: document.data()[Strings.UID])],
          ),
        if (document.data()[Strings.TYPE] == Strings.IMAGE)
          Column(
            crossAxisAlignment: myMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[ImageDetailWidget(document: document), UserNameWidget(uid: document.data()[Strings.UID])],
          ),
        if (myMessage) InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(uid: document.data()[Strings.UID]);
                    }
                )
            );
          },
          child: UserImageWidget(uid: document.data()[Strings.UID], radius: MediaQuery.of(context).size.width / 10, color: Colors.grey),
        ),
      ],
    );
  }
}
