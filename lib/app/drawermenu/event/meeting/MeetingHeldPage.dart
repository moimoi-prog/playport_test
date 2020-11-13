import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:playport_test/app/drawermenu/event/meeting/MeetingDetailPage.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/module/EventModule.dart';
import 'package:playport_test/state/eventListTab/EventListTabNotifier.dart';
import 'package:playport_test/state/meetingHeldPage/MeetingHeldNotifier.dart';
import 'package:playport_test/state/meetingHeldPage/MeetingHeldState.dart';
import 'package:provider/provider.dart';

import '../../../dialog/LoadingDialog.dart';

class MeetingHeldPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Meeting meeting;

  MeetingHeldPage({Key key, this.meeting}) : super(key: key);

  // 日時を指定したフォーマットで指定するためのフォーマッター
  DateFormat formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("オフ会開催"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "オフ会名を入力",
                  ),
                  controller: Provider.of<MeetingHeldState>(context, listen: true).titleController,
                  textAlign: TextAlign.left,
                  // ignore: missing_return
                  validator: (value) {
                    if (value == null || value == "") {
                      return "大会名は必須項目です。";
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "対象ゲーム名を入力",
                  ),
                  controller: Provider.of<MeetingHeldState>(context, listen: true).gameController,
                  textAlign: TextAlign.left,
                  // ignore: missing_return
                  validator: (value) {
                    if (value == null || value == "") {
                      return "対象ゲーム名は必須項目です。";
                    }
                  },
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "内容を入力"),
                    controller: Provider.of<MeetingHeldState>(context, listen: true).contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value == "") {
                        return "内容は必須項目です。";
                      }
                    },
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(labelText: "備考を入力"),
                    controller: Provider.of<MeetingHeldState>(context, listen: true).remarksController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(formatter.format(Provider.of<MeetingHeldState>(context, listen: true).deadLineDataTime) + "(申込締切日時)"),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_view_day),
                      onPressed: () {
                        DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
                          onChanged: (date) {
                            // print('change $date');
                          },
                          // onConfirm内の処理はDatepickerで選択完了後に呼び出される
                          onConfirm: (date) {
                            Provider.of<MeetingHeldStateNotifier>(context, listen: false).setDeadLine(date);
                          },
                          // Datepickerのデフォルトで表示する日時
                          currentTime: DateTime.now(),
                          // localによって色々な言語に対応
                          //  locale: LocaleType.en
                        );
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(formatter.format(Provider.of<MeetingHeldState>(context, listen: true).heldDataTime) + "(開催日時)"),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_view_day),
                      onPressed: () {
                        DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          // onChanged内の処理はDatepickerの選択に応じて毎回呼び出される
                          onChanged: (date) {
                            // print('change $date');
                          },
                          // onConfirm内の処理はDatepickerで選択完了後に呼び出される
                          onConfirm: (date) {
                            Provider.of<MeetingHeldStateNotifier>(context, listen: false).setHeld(date);
                          },
                          // Datepickerのデフォルトで表示する日時
                          currentTime: DateTime.now(),
                          // localによって色々な言語に対応
                          //  locale: LocaleType.en
                        );
                      },
                    )
                  ],
                ),

                // documentが存在しない場合、新規登録
                if (meeting == null) _registerButtton(context),

                // documentが存在する場合、編集
                if (meeting != null) _updateButtton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 登録用ボタン
  Widget _registerButtton(BuildContext context) {
    return RaisedButton(
      child: Text("登録"),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          // オフ会データを登録する
          DocumentReference ref = await registerEvent(Provider.of<MeetingHeldStateNotifier>(context, listen: false).map());

          // オフ会データを取得
          DocumentSnapshot doc = await ref.get();

          // Meetingインスタンスを生成
          Meeting meetingResult = createMeeting(doc);

          // 前のページに戻る
          Navigator.of(context).pop();

          // オフ会データ詳細ページに遷移
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MeetingDetailPage(
                  meeting: meetingResult,
                  organizerFlag: true,
                );
              },
            ),
          );

          // リスト内容をリロード
          Provider.of<EventListTabNotifier>(context, listen: false).reload();

          // 入力値をクリアする
          Provider.of<MeetingHeldStateNotifier>(context, listen: false).clear();
        }
      },
    );
  }

  // 編集用ボタン
  Widget _updateButtton(BuildContext context) {
    return RaisedButton(
      child: Text("更新"),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          await updateEvent(meeting.id, Provider.of<MeetingHeldStateNotifier>(context, listen: false).map());

          Navigator.of(context).pop();
        }
      },
    );
  }
}
