import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/profile/ProfilePage.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/firebase/firestore/InquiryModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';

import '../../../../drawermenu/event/battle/BattleDetailPage.dart';

// ------------------------------------
// 記事明細パーツ
// ------------------------------------
class EventRequestWidget extends StatelessWidget {
  /* event   */ final Event event;

  /* request */
  final DocumentSnapshot request;

  const EventRequestWidget({Key key, this.event, this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProfilePage(uid: request.data()[Strings.UID]);
        }));
      },
      child: Card(
        child: ListTile(
            title: FutureBuilder(
              future: FirebaseFirestore.instance.collection(Strings.USERS).doc(request.data()[Strings.UID]).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> user) {
                if (!user.hasData) {
                  return Text("ユーザー名を取得中・・・");
                }

                if (!user.data.exists) {
                  return Text("ユーザーが存在しません。");
                }

                return Text(user.data.data()[Strings.NAME]);
              },
            ),
            trailing: Wrap(spacing: 12, // space between two icons
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () async {
                      if (event is Battle) {
                        Battle battle = event;

                        // 問い合わせ用トークデータを生成
                        String inquiryId = await registerInquiry(battle.id, request.id);

                        // 申請を承認
                        await approvalEventRequest(battle.id, request.id, inquiryId);
                      } else if (event is Meeting) {
                        Meeting meeting = event;

                        // 問い合わせ用トークデータを生成
                        String inquiryId = await registerInquiry(meeting.id, request.id);

                        // 申請を承認
                        await approvalEventRequest(meeting.id, request.id, inquiryId);
                      }
                    },
                  ),
                  IconButton(
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
                ])),
      ),
    );
  }
}
