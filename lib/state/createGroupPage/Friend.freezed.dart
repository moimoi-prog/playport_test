// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'Friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FriendTearOff {
  const _$FriendTearOff();

// ignore: unused_element
  FriendData call({String uid, bool completed = false}) {
    return FriendData(
      uid: uid,
      completed: completed,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Friend = _$FriendTearOff();

/// @nodoc
mixin _$Friend {
  String get uid;
  bool get completed;

  $FriendCopyWith<Friend> get copyWith;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call({String uid, bool completed});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res> implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  final Friend _value;
  // ignore: unused_field
  final $Res Function(Friend) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object completed = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      completed: completed == freezed ? _value.completed : completed as bool,
    ));
  }
}

/// @nodoc
abstract class $FriendDataCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory $FriendDataCopyWith(
          FriendData value, $Res Function(FriendData) then) =
      _$FriendDataCopyWithImpl<$Res>;
  @override
  $Res call({String uid, bool completed});
}

/// @nodoc
class _$FriendDataCopyWithImpl<$Res> extends _$FriendCopyWithImpl<$Res>
    implements $FriendDataCopyWith<$Res> {
  _$FriendDataCopyWithImpl(FriendData _value, $Res Function(FriendData) _then)
      : super(_value, (v) => _then(v as FriendData));

  @override
  FriendData get _value => super._value as FriendData;

  @override
  $Res call({
    Object uid = freezed,
    Object completed = freezed,
  }) {
    return _then(FriendData(
      uid: uid == freezed ? _value.uid : uid as String,
      completed: completed == freezed ? _value.completed : completed as bool,
    ));
  }
}

/// @nodoc
class _$FriendData with DiagnosticableTreeMixin implements FriendData {
  const _$FriendData({this.uid, this.completed = false})
      : assert(completed != null);

  @override
  final String uid;
  @JsonKey(defaultValue: false)
  @override
  final bool completed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Friend(uid: $uid, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Friend'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FriendData &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(completed);

  @override
  $FriendDataCopyWith<FriendData> get copyWith =>
      _$FriendDataCopyWithImpl<FriendData>(this, _$identity);
}

abstract class FriendData implements Friend {
  const factory FriendData({String uid, bool completed}) = _$FriendData;

  @override
  String get uid;
  @override
  bool get completed;
  @override
  $FriendDataCopyWith<FriendData> get copyWith;
}
