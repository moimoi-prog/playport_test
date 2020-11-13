import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playport_test/data/Event.dart';

part 'FilteredEventListTabState.freezed.dart';

@freezed
abstract class FilteredEventListTabState with _$FilteredEventListTabState {
  const factory FilteredEventListTabState({
    @Default(false) bool completed,
    @Default(<Event>[]) List<Event> events,
  }) = FilteredEventListTabStateData;
}