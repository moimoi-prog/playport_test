import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ScbsState.freezed.dart';

@freezed
abstract class ScbsState with _$ScbsState {
  const factory ScbsState({
    @Default(false) bool enabled,
    TextEditingController commentController
  }) = ScbsStateData;
}
