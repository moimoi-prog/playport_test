import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

// ゲーム一覧データを表示
class GameListView extends StatelessWidget {
  /* ユーザーID */ final String uid;

  GameListView({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(uid).collection(Strings.GAMES).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> games) {
            if (!games.hasData) {
              return Text("ゲームリストを取得中・・・");
            }

            if (games.data.size == 0) {
              return Text("ゲームデータが存在しません");
            }

            return ListView.separated(
              key: PageStorageKey("game"),
              padding: EdgeInsets.only(top: 10.0),
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: games.data.size,
              itemBuilder: (context, index) => _buildListItem(context, games.data.docs[index]),
            );
          }),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text(document.data()[Strings.NAME] + "/" + document.data()[Strings.TYPE]),
          subtitle: Text(document.data()[Strings.MESSAGE]),
        )
      ],
    ));
  }
}
