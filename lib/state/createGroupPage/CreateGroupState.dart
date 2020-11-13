import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'Friend.dart';

part 'CreateGroupState.freezed.dart';

@freezed
abstract class CreateGroupState with _$CreateGroupState {
  const factory CreateGroupState({
    @Default("") String imagePath,
    TextEditingController groupNameController,
    @Default(<String>[]) List<String> selectedFriends,
    @Default(<Friend>[]) List<Friend> friends,
  }) = CreateGroupStateData;
  const factory CreateGroupState.loading() = CreateGroupStateLoading;
}