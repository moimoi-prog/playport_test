import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ShoutDetailState.dart';

part 'ShoutListState.freezed.dart';

@freezed
abstract class ShoutListState with _$ShoutListState {
  const factory ShoutListState({
    @Default(<ShoutDetailState>[]) List<ShoutDetailState> shouts, // シャウト一覧
  }) = ShoutListStateData;
  const factory ShoutListState.loading() = ShoutListStateLoading;
}
