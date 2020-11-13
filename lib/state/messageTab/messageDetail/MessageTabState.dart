import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playport_test/state/messageTab/data/MessageDetail.dart';


part 'MessageTabState.freezed.dart';

@freezed
abstract class MessageTabState with _$MessageTabState {
  const factory MessageTabState({
    @Default(<MessageDetail>[]) List<MessageDetail> messages,
  }) = MessageTabStateData;
  const factory MessageTabState.loading() = MessageTabStateLoading;
}