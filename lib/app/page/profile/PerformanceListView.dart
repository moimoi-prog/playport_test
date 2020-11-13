import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

// 実績一覧データを表示
class PerformanceListView extends StatelessWidget {
  final DocumentSnapshot document;

  const PerformanceListView({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(document.data()[Strings.UID]).collection(Strings.PERFORMANCE).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> performances) {
            if (!performances.hasData) {
              return Text("実績リストを取得中・・・");
            }

            if (performances.data.size == 0) {
              return Text("実績データが存在しません");
            }

            return ListView.builder(
              key: PageStorageKey(Strings.PERFORMANCE),
              padding: EdgeInsets.only(top: 10.0),
              itemCount: performances.data.size,
              itemBuilder: (context, index) => _buildListItem(context, performances.data.docs[index]),
            );
          }),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return InkWell(
      onTap: () async {
        print(document.data()[Strings.TITLE] + "をクリックしました");
      },
      child: new Card(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(document.data()[Strings.TITLE]),
          )
        ],
      )),
    );
  }
}
