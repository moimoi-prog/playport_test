import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playport_test/app/page/message/MessageRowWidget.dart';
import 'package:playport_test/data/Strings.dart';

class ParticipantDetailsWidget extends StatelessWidget {
  /* トークID */ final String id;
  /* 作成日   */ final Timestamp create;

  final ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  ParticipantDetailsWidget({Key key, this.id, this.create})
      : assert(id != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // クエリを生成
    Query query = FirebaseFirestore.instance.collection(Strings.INQUIRIES).doc(id).collection(Strings.MESSAGES).orderBy(Strings.TIMESTAMP, descending: false);

    if (create != null) {
      query = query.where(Strings.TIMESTAMP, isGreaterThanOrEqualTo: create);

    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          reverse: true,
          child: StreamBuilder(
              stream: query.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> message) {
                if (!message.hasData) {
                  return Text("トーク情報を取得中・・・");
                }

                if (message.data.size == 0) {
                  return Text("");
                }

                // リストを生成
                List<Widget> list = [];

                for (int i = 0; i < message.data.size; i++) {
                  list.add(MessageRowWidget(document: message.data.docs[i]));
                }

                return Column(
                  children: list,
                );
              }),
        ),
      ),
    );
  }
}
