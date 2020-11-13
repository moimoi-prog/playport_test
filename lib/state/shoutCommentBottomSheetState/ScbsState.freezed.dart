// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ScbsState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ScbsStateTearOff {
  const _$ScbsStateTearOff();

// ignore: unused_element
  ScbsStateData call(
      {bool enabled = false, TextEditingController commentController}) {
    return ScbsStateData(
      enabled: enabled,
      commentController: commentController,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ScbsState = _$ScbsStateTearOff();

/// @nodoc
mixin _$ScbsState {
  bool get enabled;
  TextEditingController get commentController;

  $ScbsStateCopyWith<ScbsState> get copyWith;
}

/// @nodoc
abstract class $ScbsStateCopyWith<$Res> {
  factory $ScbsStateCopyWith(ScbsState value, $Res Function(ScbsState) then) =
      _$ScbsStateCopyWithImpl<$Res>;
  $Res call({bool enabled, TextEditingController commentController});
}

/// @nodoc
class _$ScbsStateCopyWithImpl<$Res> implements $ScbsStateCopyWith<$Res> {
  _$ScbsStateCopyWithImpl(this._value, this._then);

  final ScbsState _value;
  // ignore: unused_field
  final $Res Function(ScbsState) _then;

  @override
  $Res call({
    Object enabled = freezed,
    Object commentController = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
      commentController: commentController == freezed
          ? _value.commentController
          : commentController as TextEditingController,
    ));
  }
}

/// @nodoc
abstract class $ScbsStateDataCopyWith<$Res>
    implements $ScbsStateCopyWith<$Res> {
  factory $ScbsStateDataCopyWith(
          ScbsStateData value, $Res Function(ScbsStateData) then) =
      _$ScbsStateDataCopyWithImpl<$Res>;
  @override
  $Res call({bool enabled, TextEditingController commentController});
}

/// @nodoc
class _$ScbsStateDataCopyWithImpl<$Res> extends _$ScbsStateCopyWithImpl<$Res>
    implements $ScbsStateDataCopyWith<$Res> {
  _$ScbsStateDataCopyWithImpl(
      ScbsStateData _value, $Res Function(ScbsStateData) _then)
      : super(_value, (v) => _then(v as ScbsStateData));

  @override
  ScbsStateData get _value => super._value as ScbsStateData;

  @override
  $Res call({
    Object enabled = freezed,
    Object commentController = freezed,
  }) {
    return _then(ScbsStateData(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
      commentController: commentController == freezed
          ? _value.commentController
          : commentController as TextEditingController,
    ));
  }
}

/// @nodoc
class _$ScbsStateData implements ScbsStateData {
  const _$ScbsStateData({this.enabled = false, this.commentController})
      : assert(enabled != null);

  @JsonKey(defaultValue: false)
  @override
  final bool enabled;
  @override
  final TextEditingController commentController;

  @override
  String toString() {
    return 'ScbsState(enabled: $enabled, commentController: $commentController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScbsStateData &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality()
                    .equals(other.enabled, enabled)) &&
            (identical(other.commentController, commentController) ||
                const DeepCollectionEquality()
                    .equals(other.commentController, commentController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enabled) ^
      const DeepCollectionEquality().hash(commentController);

  @override
  $ScbsStateDataCopyWith<ScbsStateData> get copyWith =>
      _$ScbsStateDataCopyWithImpl<ScbsStateData>(this, _$identity);
}

abstract class ScbsStateData implements ScbsState {
  const factory ScbsStateData(
      {bool enabled,
      TextEditingController commentController}) = _$ScbsStateData;

  @override
  bool get enabled;
  @override
  TextEditingController get commentController;
  @override
  $ScbsStateDataCopyWith<ScbsStateData> get copyWith;
}
