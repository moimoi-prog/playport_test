import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MeetingHeldState.freezed.dart';

@freezed
abstract class MeetingHeldState with _$MeetingHeldState {
  const factory MeetingHeldState({
    TextEditingController titleController,
    TextEditingController gameController,
    TextEditingController contentController,
    TextEditingController remarksController,
    DateTime deadLineDataTime,
    DateTime heldDataTime,
  }) = MeetingHeldStateData;
}
