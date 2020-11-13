import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:state_notifier/state_notifier.dart';

import 'BattleHeldState.dart';

// ------------------------------------
// クラス名　: OpponentStateNotifier
// クラス概要: 相手ComponentNotifier
// ------------------------------------
class BattleHeldStateNotifier extends StateNotifier<BattleHeldState> with LocatorMixin {
  BattleHeldStateNotifier() : super(BattleHeldStateData());

  // 初期化
  void initState() {
    super.initState(); // 親クラスの初期化処理を呼び出す

    state = BattleHeldState(
        // stateを初期化する
        titleController: TextEditingController(text: ""),
        gameController: TextEditingController(text: ""),
        ruleController: TextEditingController(text: ""),
        prizeController: TextEditingController(text: ""),
        remarksController: TextEditingController(text: ""),
        deadLineDataTime: DateTime.now(),
        heldDataTime: DateTime.now());
  }

  // documentを読み込む
  void readDocument(DocumentSnapshot document) {
    // 現在のステータスを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      // stateを初期化する
      titleController: TextEditingController(text: document.data()["title"]),
      gameController: TextEditingController(text: document.data()["game"]),
      ruleController: TextEditingController(text: document.data()["rule"]),
      prizeController: TextEditingController(text: document.data()["prize"]),
      remarksController: TextEditingController(text: document.data()["remarks"]),
      deadLineDataTime: document.data()["deadline"].toDate(),
      heldDataTime: document.data()["held"].toDate(),
    );
  }

  // documentを読み込む
  void readBattle(Battle battle) {
    // 現在のステータスを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      // stateを初期化する
      titleController: TextEditingController(text: battle.title),
      gameController: TextEditingController(text: battle.game),
      ruleController: TextEditingController(text: battle.rule),
      prizeController: TextEditingController(text: battle.prize),
      remarksController: TextEditingController(text: battle.remarks),
      deadLineDataTime: battle.deadLine,
      heldDataTime: battle.held,
    );
  }

  // deadLineを変更する
  void setDeadLine(DateTime date) {
    // 現在のstateを取得
    final currentState = state;

    // 値を取得
    TextEditingController titleController = currentState.titleController;
    TextEditingController gameController = currentState.gameController;
    TextEditingController ruleController = currentState.ruleController;
    TextEditingController prizeController = currentState.prizeController;
    TextEditingController remarksController = currentState.remarksController;
    DateTime heldDataTime = currentState.heldDataTime;

    // stateを更新
    state = currentState.copyWith(
      titleController: titleController,
      gameController: gameController,
      ruleController: ruleController,
      prizeController: prizeController,
      remarksController: remarksController,
      deadLineDataTime: date,
      heldDataTime: heldDataTime,
    );
  }

  // HEldを変更する
  void setHeld(DateTime date) {
    // 現在のstateを取得
    final currentState = state;

    // 値を取得
    TextEditingController titleController = currentState.titleController;
    TextEditingController gameController = currentState.gameController;
    TextEditingController ruleController = currentState.ruleController;
    TextEditingController prizeController = currentState.prizeController;
    TextEditingController remarksController = currentState.remarksController;
    DateTime deadLineDataTime = currentState.deadLineDataTime;

    // stateを更新
    state = currentState.copyWith(
      titleController: titleController,
      gameController: gameController,
      ruleController: ruleController,
      prizeController: prizeController,
      remarksController: remarksController,
      deadLineDataTime: deadLineDataTime,
      heldDataTime: date,
    );
  }

  // 内容をクリアする
  void clear() {
    super.initState(); // 親クラスの初期化処理を呼び出す

    state = BattleHeldState(
        // stateを初期化する
        titleController: TextEditingController(text: ""),
        gameController: TextEditingController(text: ""),
        ruleController: TextEditingController(text: ""),
        prizeController: TextEditingController(text: ""),
        remarksController: TextEditingController(text: ""),
        deadLineDataTime: DateTime.now(),
        heldDataTime: DateTime.now());
  }

  // フォームデータをマップに変換
  Map<String, dynamic> map() {
    Map<String, dynamic> map = { // マップを生成
      Strings.TITLE: state.titleController.text,
      Strings.ORGANIZER: user.uid,
      Strings.GAME: state.gameController.text,
      Strings.RULE: state.ruleController.text,
      Strings.PRIZE: state.prizeController.text,
      Strings.REMARKS: state.remarksController.text,
      Strings.DEADLINE: Timestamp.fromDate(state.deadLineDataTime),
      Strings.HELD: Timestamp.fromDate(state.heldDataTime),
      Strings.TYPE: Strings.BATTLE,
      Strings.OFFICIAL: false,
      Strings.TIMESTAMP: DateTime.now()
    };

    return map;
  }

}
