import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playport_test/data/Event.dart';

part 'EventHeldListState.freezed.dart';

@freezed
abstract class EventHeldListState with _$EventHeldListState {
  const factory EventHeldListState({
    @Default(<Event>[]) List<Event> events,
  }) = EventHeldListStateData;
  const factory EventHeldListState.loading() = EventHeldListStateLoading;
}