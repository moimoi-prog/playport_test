import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Meeting.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import 'MeetingHeldState.dart';

// ------------------------------------
// クラス名　: OpponentStateNotifier
// クラス概要: 相手ComponentNotifier
// ------------------------------------
class MeetingHeldStateNotifier extends StateNotifier<MeetingHeldState> with LocatorMixin {
  MeetingHeldStateNotifier() : super(MeetingHeldStateData());

  // 初期化
  void initState() {
    super.initState(); // 親クラスの初期化処理を呼び出す

    state = MeetingHeldState(
        // stateを初期化する
        titleController: TextEditingController(text: ""),
        gameController: TextEditingController(text: ""),
        contentController: TextEditingController(text: ""),
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
      contentController: TextEditingController(text: document.data()["content"]),
      remarksController: TextEditingController(text: document.data()["remarks"]),
      deadLineDataTime: document.data()["deadLine"].toDate(),
      heldDataTime: document.data()["held"].toDate(),
    );
  }

  void readMeeting(Meeting meeting) {
    // 現在のステータスを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      // stateを初期化する
      titleController: TextEditingController(text: meeting.title),
      gameController: TextEditingController(text: meeting.game),
      contentController: TextEditingController(text: meeting.content),
      remarksController: TextEditingController(text: meeting.remarks),
      deadLineDataTime: meeting.deadLine,
      heldDataTime: meeting.held,
    );
  }

  // deadLineを変更する
  void setDeadLine(DateTime date) {
    // 現在のstateを取得
    final currentState = state;

    // 値を取得
    TextEditingController titleController = currentState.titleController;
    TextEditingController gameController = currentState.gameController;
    TextEditingController contentController = currentState.contentController;
    TextEditingController remarksController = currentState.remarksController;
    DateTime heldDataTime = currentState.heldDataTime;

    // stateを更新
    state = currentState.copyWith(
      titleController: titleController,
      gameController: gameController,
      contentController: contentController,
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
    TextEditingController contentController = currentState.contentController;
    TextEditingController remarksController = currentState.remarksController;
    DateTime deadLineDataTime = currentState.deadLineDataTime;

    // stateを更新
    state = currentState.copyWith(
      titleController: titleController,
      gameController: gameController,
      contentController: contentController,
      remarksController: remarksController,
      deadLineDataTime: deadLineDataTime,
      heldDataTime: date,
    );
  }

  // 内容をクリアする
  void clear() {
    super.initState(); // 親クラスの初期化処理を呼び出す

    state = MeetingHeldState(
        // stateを初期化する
        titleController: TextEditingController(text: ""),
        gameController: TextEditingController(text: ""),
        contentController: TextEditingController(text: ""),
        remarksController: TextEditingController(text: ""),
        deadLineDataTime: DateTime.now(),
        heldDataTime: DateTime.now());
  }

  // フォームデータをマップに変換
  Map<String, dynamic> map() {
    Map<String, dynamic> map = { // マップを生成
      "title": state.titleController.text,
      "organizer": user.uid,
      "game": state.gameController.text,
      "content": state.contentController.text,
      "remarks": state.remarksController.text,
      "deadline": Timestamp.fromDate(state.deadLineDataTime),
      "held": Timestamp.fromDate(state.heldDataTime),
      "type": "meeting",
      "official": false,
      "timestamp": DateTime.now()
    };

    return map;
  }

}
