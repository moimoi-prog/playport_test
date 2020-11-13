import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playport_test/data/Event.dart';

part 'EventListTabState.freezed.dart';

@freezed
abstract class EventListTabState with _$EventListTabState {
  const factory EventListTabState({
    @Default(<Event>[]) List<Event> events,
    ScrollController controller
  }) = EventListTabStateData;
  const factory EventListTabState.loading() = EventListTabStateLoading;
}