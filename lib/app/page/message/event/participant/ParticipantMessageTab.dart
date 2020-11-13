import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/app/page/message/event/whole/WholeSendWidget.dart';
import 'package:playport_test/app/widget/CircleImageWidget.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/module/MessageModule.dart';

import 'ParticipantDetailSearchWidget.dart';
import 'ParticipantDetailsWidget.dart';
import 'ParticipantMessagePage.dart';
import 'ParticipantSendWidget.dart';
import 'ParticipiantMemberSearchWidget.dart';



class ParticipantMessagesTab extends StatelessWidget {
  final String id;

  ParticipantMessagesTab({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 処理中画面
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: FutureBuilder( // イベントの参加者一覧を取得
                          future: FirebaseFirestore.instance
                              .collection(Strings.EVENTS)
                              .doc(id)
                              .collection(Strings.REQUESTS)
                              .where(Strings.STATUS, isEqualTo: ApplicationStatus.APPROVAL)
                              .get(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> requests) {
                            if (!requests.hasData) {
                              return Text("イベント情報を取得中・・・");
                            }

                            if (requests.data.size == 0) {
                              return Text("参加者が存在しません");
                            }



                            return ListView.separated(
                                padding: EdgeInsets.only(top: 10.0),
                                separatorBuilder: (BuildContext context, index) {
                                  return Divider();
                                },
                                itemCount: requests.data.size,
                                itemBuilder: (context, index) {
                                  return FutureBuilder( // 参加者名を取得
                                    future: FirebaseFirestore.instance
                                        .collection(Strings.USERS)
                                        .doc(requests.data.docs[index].data()[Strings.UID])
                                        .get(),
                                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> user) {
                                      if (!user.hasData) {
                                        return Text("");
                                      }

                                      if (!user.data.exists) {
                                        return Text("ユーザーが存在しません");
                                      }

                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                    return ParticipantMessagesPage(title: user.data.data()[Strings.NAME], request: requests.data.docs[index]);
                                                  }
                                              )
                                          );
                                        },
                                        child: ListTile(
                                          leading: UserImageWidget(uid: requests.data.docs[index].data()[Strings.UID], radius: MediaQuery.of(context).size.width / 8, color: Colors.grey),
                                          title: Text(user.data.data()[Strings.NAME]),
                                          subtitle: StreamBuilder(
                                            stream: FirebaseFirestore.instance.collection(Strings.INQUIRIES).doc(requests.data.docs[index].data()[Strings.INQUIRY]).collection(Strings.MESSAGES).snapshots(),
                                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> queries) {
                                              if (!queries.hasData) {
                                                return Text("");
                                              }

                                              if (queries.data.size == 0) {
                                                return Text("");
                                              }

                                              return Text(getMessage(queries.data.docs));
                                            },
                                          )
                                        )
                                      );
                                    },
                                  );
                                });
                          }
                      )
                  )
              ),

              // メッセージ送信用Widget
              ParticipiantMemberSearchWidget(id: id),
            ],
          ),
        ), // bottomNavigationBar: TalkSendMessageWidget(id: id),
      ),
    );
  }
}
