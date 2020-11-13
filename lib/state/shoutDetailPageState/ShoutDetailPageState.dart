import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'CommentData.dart';

part 'ShoutDetailPageState.freezed.dart';

@freezed
abstract class ShoutDetailPageState with _$ShoutDetailPageState {
  const factory ShoutDetailPageState({
    @Default(<CommentData>[]) List<CommentData> comments,
  }) = ShoutDetailPageStateData;
  const factory ShoutDetailPageState.loading() = ShoutDetailPageStateLoading;
}