import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/main/shout/ShoutDetailWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/state/shoutListTab/ShoutDetailState.dart';
import 'package:playport_test/state/shoutListTab/ShoutListState.dart';
import 'package:provider/provider.dart';

// 投稿一覧データを表示
class PostListView extends StatelessWidget {
  final String uid;

  const PostListView({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Provider.of<ShoutListState>(context, listen: true).when((shouts) {
        List<ShoutDetailState> myShouts = [];

        shouts.forEach((shout) {
          if (shout.uid == uid) {
            myShouts.add(shout);
          }
        });

        if (myShouts.length == 0) {
          return Text("シャウトデータが存在しません");
        }

        return ListView.separated(
            padding: EdgeInsets.only(top: 5.0),
            itemCount: myShouts.length,
            separatorBuilder: (BuildContext context, index) {
              return Divider();
            },
            itemBuilder: (context, index) => Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: ShoutDetailWidget(shout: myShouts[index]),
              actions: <Widget>[
                IconSlideAction(
                  caption: '共有',
                  color: Colors.indigo,
                  icon: Icons.share,
                  onTap: () => Fluttertoast.showToast(msg: "共有"),
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: '通報',
                  color: Colors.red,
                  icon: Icons.report_problem,
                  onTap: () => Fluttertoast.showToast(msg: "通報"),
                ),
              ],
            ));
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
      // child: StreamBuilder(
      //     stream: FirebaseFirestore.instance.collection(Strings.SHOUTS).where(Strings.UID, isEqualTo: uid).orderBy(Strings.TIMESTAMP, descending: true).snapshots(),
      //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> posts) {
      //       if (!posts.hasData) {
      //         return Text("シャウト一覧を取得中・・・");
      //       }
      //
      //       if (posts.data.size == 0) {
      //         return Text("シャウトデータが存在しません");
      //       }
      //
      //       return ListView.builder(
      //         key: PageStorageKey(Strings.SHOUTS),
      //         padding: EdgeInsets.only(top: 10.0),
      //         itemCount: posts.data.size,
      //         itemBuilder: (context, index) => ShoutDetailWidget(postDoc: posts.data.docs[index]),
      //       );
      //     }),
    );
  }
}
