import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';


class ParticipiantMemberSearchWidget extends StatelessWidget {
  /* ルームID  */ final String id;

  final TextEditingController _messageController = TextEditingController();

  ParticipiantMemberSearchWidget({Key key, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // 1行目
        children: <Widget>[
          Expanded(
            // 2.1列目
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "参加者を検索"),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
