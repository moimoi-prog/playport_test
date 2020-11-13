import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

import 'FixedPopupMenu.dart';


class FixedEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("定型文を編集"),
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.FIXED).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> games) {
                if (!games.hasData) {
                  return Text("定型文リストを取得中・・・");
                }

                if (games.data.size == 0) {
                  return Text("定型文データが存在しません");
                }

                return ListView.builder(
                  key: PageStorageKey(Strings.FIXED),
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: games.data.size,
                  itemBuilder: (context, index) => _buildListItem(context, games.data.docs[index]),
                );
              }),
        ));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(document.data()[Strings.MESSAGE]),
              trailing: FixedPopupMenu(document: document),
            )
          ],
        ));
  }
}
