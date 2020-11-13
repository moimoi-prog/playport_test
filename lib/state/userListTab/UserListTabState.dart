import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'Matching.dart';

part 'UserListTabState.freezed.dart';

@freezed
abstract class UserListTabState with _$UserListTabState {
  const factory UserListTabState({
    @Default(<Matching>[]) List<Matching> matchings,
  }) = UserListTabStateData;
  const factory UserListTabState.loading() = UserListTabStateLoading;
}