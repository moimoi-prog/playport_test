import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/message/auto/AutoDetailSearchWidget.dart';
import 'package:playport_test/app/page/message/auto/AutoDetailsWidget.dart';
import 'package:playport_test/app/page/message/auto/AutoSendWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/AutosModule.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';

// ----------------------------------
// クラス名　: TalkPage
// 処理概要　: トーク画面
// ----------------------------------
class AutoMatchingTalkPage extends StatelessWidget {
  /* ルームID */ final String id;

  AutoMatchingTalkPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 処理中画面
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(Strings.AUTOS).doc(id).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
          // マッチング中であることを表示
          if (!doc.hasData || !doc.data.data()[Strings.COMPLETE]) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              )
            );
          }

          Fluttertoast.showToast(msg: "マッチング成功・・・");

          return StreamBuilder(
              stream: FirebaseFirestore.instance.collection(Strings.AUTOS).doc(id).collection(Strings.MEMBERS).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> docs) {
                // データ取得中
                if (!docs.hasData || docs.data.size != 2) {
                  return Scaffold(
                      body: Text("ユーザー名を取得中・・・")
                  );
                }

                // 相手ユーザーを取得
                String opponent;
                if (docs.data.docs[0].id == user.uid) {
                  opponent = docs.data.docs[1].id;
                } else {
                  opponent = docs.data.docs[0].id;
                }

                if (!docs.hasData) {
                  return Scaffold(
                      body: Text("ユーザー名を取得中・・・")
                  );
                }

                return WillPopScope(
                  onWillPop: () async {
                    getUser(user.uid).then((value) {
                      sendAutoMessage(id, user.uid, opponent, value.data()[Strings.NAME] + "が退出しました。", Strings.INFO);
                    });
                    Navigator.pop(context);
                    return null;
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      title: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection(Strings.USERS).doc(opponent).snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> doc) {
                            // データ取得中
                            if (!doc.hasData) {
                              return Text("ユーザー名を取得中・・・");
                            }

                            // 相手ユーザーを取得
                            return Text(doc.data.data()[Strings.NAME]);
                          }),
                      // TalkDetailSearchWidget(hintText: title),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            Fluttertoast.showToast(msg: "設定ボタンをタップしました。");
                          },
                        ),
                      ],
                    ),
                    body: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                              // トーク内容検索用Widget
                              AutoDetailSearchWidget(),

                              // メッセージ内容表示用Widget
                              AutoDetailsWidget(id: id),

                              // メッセージ送信用Widget
                              AutoSendWidget(id: id),
                            ]))),
                  ),
                );
              });
        },
      ),
    );
  }
}
