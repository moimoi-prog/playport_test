import 'package:playport_test/data/Event.dart';
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Battle.freezed.dart';
@freezed
abstract class Battle extends Event with _$Battle {
  const factory Battle({
    String uid, // 主催者
    String id, // 大会ID
    String title, // タイトル
    String prize, // 賞品
    String rule, // ルール
    String game, // ゲーム
    bool official, // 公式フラグ
    String type, // イベント種別
    String remarks, // 備考
    DateTime timestamp, // 登録日
    DateTime held, // 開催日
    DateTime deadLine, // 締切日
  }) = BattleData;
}