import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';
import 'package:playport_test/state/userListTab/UserListTabNotifier.dart';
import 'package:provider/provider.dart';

// ------------------------------------
// フレンドボタンパーツ
// ------------------------------------
class FriendButton extends StatelessWidget {
  final Color color;

  const FriendButton({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("フレンド"),
        color: color,
        shape: StadiumBorder(),
        onPressed: () async {
          Fluttertoast.showToast(msg: "フレンド");
        });
  }
}

// ------------------------------------
// リクエスト送信中送信ボタンパーツ
// ------------------------------------
class RequestButton extends StatelessWidget {
  final Color color;

  const RequestButton({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("送信済み"),
        color: color,
        shape: StadiumBorder(),
        onPressed: () async {
          Fluttertoast.showToast(msg: "送信済み");
        });
  }
}

// ------------------------------------
// 申請ボタンパーツ
// ------------------------------------
class SendButton extends StatelessWidget {
  final Color color;
  final String uid;

  const SendButton({Key key, this.color, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("申請"),
        color: Theme.of(context).backgroundColor,
        shape: StadiumBorder(),
        onPressed: () async {
          await sendFriendRequest(user.uid, uid);
          await Provider.of<UserListTabNotifier>(context, listen: false).reload();
          Fluttertoast.showToast(msg: "フレンド申請を送信しました。");
        });
  }
}