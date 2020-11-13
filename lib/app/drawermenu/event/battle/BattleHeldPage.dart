import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/firebase/firestore/PostModule.dart';
import 'package:playport_test/firebase/firestore/EventModule.dart';
import 'package:playport_test/module/EventModule.dart';
import 'package:playport_test/state/battleHeldPage/BattleHeldNotifier.dart';
import 'package:playport_test/state/battleHeldPage/BattleHeldState.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/state/eventListTab/EventListTabNotifier.dart';
import 'package:provider/provider.dart';

import '../../../dialog/LoadingDialog.dart';
import 'BattleDetailPage.dart';

class BattleHeldPage extends StatelessWidget {
  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 日時を指定したフォーマットで指定するためのフォーマッター
  final DateFormat formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

  // 引数
  final Battle battle;

  BattleHeldPage({Key key, this.battle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント開催"),
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
                    labelText: "大会名を入力",
                  ),
                  controller: Provider.of<BattleHeldState>(context, listen: true).titleController,
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
                  controller: Provider.of<BattleHeldState>(context, listen: true).gameController,
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
                    decoration: InputDecoration(labelText: "ルールを入力"),
                    controller: Provider.of<BattleHeldState>(context, listen: true).ruleController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value == "") {
                        return "ルールは必須項目です。";
                      }
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "賞品(未入力の場合、なし)",
                  ),
                  controller: Provider.of<BattleHeldState>(context, listen: true).prizeController,
                  textAlign: TextAlign.left,
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(labelText: "備考を入力"),
                    controller: Provider.of<BattleHeldState>(context, listen: true).remarksController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(formatter.format(Provider.of<BattleHeldState>(context, listen: true).deadLineDataTime) + "(申込締切日時)"),
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
                            Provider.of<BattleHeldStateNotifier>(context, listen: false).setDeadLine(date);
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
                      child: Text(formatter.format(Provider.of<BattleHeldState>(context, listen: true).heldDataTime) + "(開催日時)"),
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
                            Provider.of<BattleHeldStateNotifier>(context, listen: false).setHeld(date);
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
                if (battle == null) _registerButtton(context),

                // documentが存在する場合、編集
                if (battle != null) _updateButtton(context)
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
          // 大会データを登録
          DocumentReference ref = await registerEvent(Provider.of<BattleHeldStateNotifier>(context, listen: false).map());

          // 大会データを取得
          DocumentSnapshot doc = await ref.get();

          // Battleインスタンスを生成
          Battle battleResult = createBattle(doc);

          // 前のページに戻る(BottomSheetを閉じる)
          Navigator.of(context).pop();

          // 登録したデータを表示する
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BattleDetailPage(
                  battle: battleResult,
                  organizerFlag: true
                );
              }
            )
          );

          // リスト内容をリロード
          Provider.of<EventListTabNotifier>(context, listen: false).reload();

          // 入力値をクリアする
          Provider.of<BattleHeldStateNotifier>(context, listen: false).clear();
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
          await updateEvent(battle.id, Provider.of<BattleHeldStateNotifier>(context, listen: false).map());

          Navigator.of(context).pop();
        }
      },
    );
  }
}
