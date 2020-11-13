import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BattleHeldState.freezed.dart';

@freezed
abstract class BattleHeldState with _$BattleHeldState {
  const factory BattleHeldState({
    TextEditingController titleController,
    TextEditingController gameController,
    TextEditingController ruleController,
    TextEditingController prizeController,
    TextEditingController remarksController,
    DateTime deadLineDataTime,
    DateTime heldDataTime,
  }) = BattleHeldStateData;
}
