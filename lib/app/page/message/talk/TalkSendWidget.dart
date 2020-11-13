import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/message/talk/TalkOperationBottmnSheet.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/RoomType.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/TalkModule.dart';

class TalkSendWidget extends StatelessWidget {
  /* ルームID  */ final String id;
  /* 相手   　 */ final String opponent;

  final TextEditingController _messageController = TextEditingController();

  TalkSendWidget({Key key, this.id, this.opponent})
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
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () async {
              showTalkOperationBottmnSheet(context, id, opponent);
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FIXED).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> doc) {
              if (!doc.hasData || doc.data.size == 0) {
                return IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "定型文を登録してください");
                  },
                );
              }

              List<PopupMenuEntry<String>> list = [];

              for (int i = 0; i <  doc.data.size; i++) {
                list.add(
                    PopupMenuItem<String>(
                        value: doc.data.docs[i].data()[Strings.MESSAGE],
                        child: Text(doc.data.docs[i].data()[Strings.MESSAGE])
                    )
                );
              }


              return PopupMenuButton<String>(
                  icon: Icon(Icons.message),
                  onSelected: (String value) async {
                    await sendTalkMessage(id, user.uid, opponent, value, Strings.TEXT);
                  },
                  itemBuilder: (BuildContext context) => list
              );
            },
          ),
          Expanded(
            // 2.1列目
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "メッセージを入力"),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () async {
                if (_messageController.text != null && _messageController.text != "") {
                  sendTalkMessage(id, user.uid, opponent, _messageController.text, Strings.TEXT);
                  _messageController.clear();
                }
              }),
        ],
      ),
    );
  }
}
