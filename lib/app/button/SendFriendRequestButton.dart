import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendFriendRequestButton extends StatelessWidget {
  final DocumentSnapshot document;

  const SendFriendRequestButton({Key key, this.document}) : assert(document != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("友達申請"),
        color: Theme.of(context).primaryColor,
        shape: StadiumBorder(),
        onPressed: () async {
          Fluttertoast.showToast(msg: "友達申請をタップしました。");
        }
    );
  }
}