import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Friend.freezed.dart';

@freezed
abstract class Friend with _$Friend {
  const factory Friend({
    String uid,
    @Default(false) bool completed,
  }) = FriendData;
}