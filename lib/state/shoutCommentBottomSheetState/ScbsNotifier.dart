import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:state_notifier/state_notifier.dart';

import 'ScbsState.dart';

// ------------------------------------
// クラス名　: OpponentStateNotifier
// クラス概要: 相手ComponentNotifier
// ------------------------------------
class ScbsNotifier extends StateNotifier<ScbsState> with LocatorMixin {
  ScbsNotifier() : super(ScbsStateData());

  // 初期化
  void initState() {
    super.initState(); // 親クラスの初期化処理を呼び出す

    state = ScbsState( // 初期化する
        enabled: false,
        commentController: TextEditingController(text: "")
    );
  }

  // 更新
  void change(bool flag) {
    final currentState = state;

    state = currentState.copyWith( // 更新する
        enabled: flag,
        commentController: currentState.commentController
    );
  }

  // 更新
  void reset() {
    final currentState = state;

    state = currentState.copyWith( // 初期化する
        enabled: false,
        commentController: TextEditingController(text: "")
    );
  }

  // テキストを取得
  String getText() {
    return state.commentController.text;
  }
}
