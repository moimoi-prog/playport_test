import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/firebase/firestore/InquiryModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';

import '../../../../drawermenu/event/battle/BattleDetailPage.dart';

// ------------------------------------
// クラス名　: EventApprovalWidget
// クラス概要: EventApprovalPageのリストに表示するWidget
// ------------------------------------
class EventApprovalWidget extends StatelessWidget {
  final Event event; // イベントデータ
  final DocumentSnapshot request; // リクエストデータ

  const EventApprovalWidget({ // コンストラクタ
    Key key,
    this.event,
    this.request
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push( // プロフィール画面へ遷移
          MaterialPageRoute(
            builder: (context) {
              return ProfilePage( // 引数を指定
                  uid: request.data()[Strings.UID]
              );
            })
        );
      },
      child: FutureBuilder(
        future: FirebaseFirestore.instance // ユーザー情報を取得
            .collection(Strings.USERS)
            .doc(request.data()[Strings.UID])
            .get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> user) {
          if (!user.hasData) {
            return Text("ユーザー名を取得中・・・");
          }

          if (!user.data.exists) {
            return Text("ユーザーが存在しません。");
          }

          return ListTile(
            leading: UserImageWidgetFromPath( // プロフィール画像
              path: user.data.data()[Strings.PROFILE_IMAGE_PATH],
              radius: MediaQuery.of(context).size.height / 8,
              color: Colors.grey
            ),
            title: Text( // ユーザー名
              user.data.data()[Strings.NAME]
            ),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                if (event is Battle) {
                  Battle battle = event;

                  // 申請を拒否
                  rejectEventRequest(battle.id, request.id);
                } else if (event is Meeting) {
                  Meeting meeting = event;

                  // 申請を拒否
                  rejectEventRequest(meeting.id, request.id);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
