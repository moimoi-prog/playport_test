import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

class UserNameWidget extends StatelessWidget {
  final String uid;

  const UserNameWidget({Key key, this.uid}) :
        assert(uid != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
        if (!doc.hasData) {
          return Text("ユーザー名を取得中");
        }

        return Text(doc.data.data()[Strings.NAME]);

        // , style: TextStyle(color: Colors.grey, fontSize: 8)
      },
    );
  }
}
