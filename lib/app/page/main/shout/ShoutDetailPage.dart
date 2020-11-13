import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/firestore/CommentModule.dart';
import 'package:playport_test/module/CommonModule.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsNotifier.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsState.dart';
import 'package:playport_test/state/shoutDetailPageState/CommentData.dart';
import 'package:playport_test/state/shoutDetailPageState/ShoutDetailPageNotifier.dart';
import 'package:playport_test/state/shoutDetailPageState/ShoutDetailPageState.dart';
import 'package:playport_test/state/shoutListTab/ShoutDetailState.dart';
import 'package:provider/provider.dart';

// ----------------------------------
// クラス名　: ShoutDetailPage
// 処理概要　: 選挙
// ----------------------------------
class ShoutDetailPage extends StatelessWidget {
  final ShoutDetailState shout;
  final double width;

  ShoutDetailPage({Key key, this.shout, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("シャウト")),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: _shoutWidget(context),
              ),
              Divider(),
              Expanded(
                  child: Provider.of<ShoutDetailPageState>(context, listen: true).when((comments) {
                    return RefreshIndicator(
                        onRefresh: () async {
                          Provider.of<ShoutDetailPageNotifier>(context, listen: false).reload(shout.id);
                        },
                        child: ListView.builder(
                          // padding: EdgeInsets.only(right: 5.0, left: 5.0),
                          // separatorBuilder: (BuildContext context, index) {
                          //   return Divider();
                          // },
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            return _commentWidget(context, comments[index]);
                          },
                        )
                    );
                  }, loading: () {
                    return Center(child: CircularProgressIndicator());
                  })),
              _commentInputFieldWidget(context)
            ],
          )
      ),
    );
  }

  // 投稿パーツ
  Widget _shoutWidget(BuildContext context) {
    return Container(
      child: ListTile(
        leading: UserImageWidget(uid: shout.uid, radius: MediaQuery.of(context).size.width / 8, color: Colors.grey, profile: true),
        // trailing: (document.data()[Strings.UID] == user.uid) ?  PostPopupMenu(document: document) : Text(""),
        title: StreamBuilder(
            stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(shout.uid).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
              if (!doc.hasData) {
                return Text("ユーザー名を取得中・・・");
              }

              if (doc.data == null) {
                return Text("Error: ユーザー名が不明です。");
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(doc.data.data()[Strings.NAME], style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text(getFormattedDate("yyyy/MM/dd", shout.shoutTimeStamp), style: TextStyle(color: Colors.grey)),
                      InkWell(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(Icons.star_border, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
              child: Text(shout.shoutDetail, style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            Text("コメント数: " + shout.shoutComments.toString(), style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  // コメントパーツ
  Widget _commentWidget(BuildContext context, CommentData comment) {
    return ListTile(
      leading: InkWell(
        // プロフィール画面へ遷移
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ProfilePage(uid: comment.uid);
              },
            ),
          );
        },
        child: Container(
          // ユーザー画像
            width: width / 9,
            height: width / 9,
            decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(comment.image)))),
      ),
      title: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(" " + getFormattedDate("yyyy/MM/dd", comment.date), style: TextStyle(color: Colors.grey)),
        ],
      ),
      subtitle: Text(
        // コメント内容
        comment.content,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // コメント入力欄
  Widget _commentInputFieldWidget(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(hintText: "コメントを送信"),
                controller: Provider.of<ScbsState>(context, listen: true).commentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  if (value != null && value != "") {
                    Provider.of<ScbsNotifier>(context, listen: false).change(true);
                  } else {
                    Provider.of<ScbsNotifier>(context, listen: false).change(false);
                  }
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: !Provider.of<ScbsState>(context, listen: true).enabled
                  ? null
                  : () async {
                      await registerComment(shout.id, Provider.of<ScbsNotifier>(context, listen: false).getText());
                      Provider.of<ScbsNotifier>(context, listen: false).reset();
                      Provider.of<ShoutDetailPageNotifier>(context, listen: false).reload(shout.id);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
            )
          ],
        ),
      ),
    );
  }
}
