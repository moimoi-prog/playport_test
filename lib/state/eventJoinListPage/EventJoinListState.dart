import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playport_test/data/Event.dart';

part 'EventJoinListState.freezed.dart';

@freezed
abstract class EventJoinListState with _$EventJoinListState {
  const factory EventJoinListState({
    @Default(<Event>[]) List<Event> events,
    @Default(<String>[]) List<String> status,
  }) = EventJoinListStateData;
  const factory EventJoinListState.loading() = EventJoinListStateLoading;
}