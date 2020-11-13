// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'UserListTabState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserListTabStateTearOff {
  const _$UserListTabStateTearOff();

// ignore: unused_element
  UserListTabStateData call({List<Matching> matchings = const <Matching>[]}) {
    return UserListTabStateData(
      matchings: matchings,
    );
  }

// ignore: unused_element
  UserListTabStateLoading loading() {
    return const UserListTabStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $UserListTabState = _$UserListTabStateTearOff();

/// @nodoc
mixin _$UserListTabState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Matching> matchings), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Matching> matchings), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserListTabStateData value), {
    @required Result loading(UserListTabStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserListTabStateData value), {
    Result loading(UserListTabStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $UserListTabStateCopyWith<$Res> {
  factory $UserListTabStateCopyWith(
          UserListTabState value, $Res Function(UserListTabState) then) =
      _$UserListTabStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserListTabStateCopyWithImpl<$Res>
    implements $UserListTabStateCopyWith<$Res> {
  _$UserListTabStateCopyWithImpl(this._value, this._then);

  final UserListTabState _value;
  // ignore: unused_field
  final $Res Function(UserListTabState) _then;
}

/// @nodoc
abstract class $UserListTabStateDataCopyWith<$Res> {
  factory $UserListTabStateDataCopyWith(UserListTabStateData value,
          $Res Function(UserListTabStateData) then) =
      _$UserListTabStateDataCopyWithImpl<$Res>;
  $Res call({List<Matching> matchings});
}

/// @nodoc
class _$UserListTabStateDataCopyWithImpl<$Res>
    extends _$UserListTabStateCopyWithImpl<$Res>
    implements $UserListTabStateDataCopyWith<$Res> {
  _$UserListTabStateDataCopyWithImpl(
      UserListTabStateData _value, $Res Function(UserListTabStateData) _then)
      : super(_value, (v) => _then(v as UserListTabStateData));

  @override
  UserListTabStateData get _value => super._value as UserListTabStateData;

  @override
  $Res call({
    Object matchings = freezed,
  }) {
    return _then(UserListTabStateData(
      matchings:
          matchings == freezed ? _value.matchings : matchings as List<Matching>,
    ));
  }
}

/// @nodoc
class _$UserListTabStateData
    with DiagnosticableTreeMixin
    implements UserListTabStateData {
  const _$UserListTabStateData({this.matchings = const <Matching>[]})
      : assert(matchings != null);

  @JsonKey(defaultValue: const <Matching>[])
  @override
  final List<Matching> matchings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserListTabState(matchings: $matchings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserListTabState'))
      ..add(DiagnosticsProperty('matchings', matchings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserListTabStateData &&
            (identical(other.matchings, matchings) ||
                const DeepCollectionEquality()
                    .equals(other.matchings, matchings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(matchings);

  @override
  $UserListTabStateDataCopyWith<UserListTabStateData> get copyWith =>
      _$UserListTabStateDataCopyWithImpl<UserListTabStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Matching> matchings), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(matchings);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Matching> matchings), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(matchings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserListTabStateData value), {
    @required Result loading(UserListTabStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserListTabStateData value), {
    Result loading(UserListTabStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class UserListTabStateData implements UserListTabState {
  const factory UserListTabStateData({List<Matching> matchings}) =
      _$UserListTabStateData;

  List<Matching> get matchings;
  $UserListTabStateDataCopyWith<UserListTabStateData> get copyWith;
}

/// @nodoc
abstract class $UserListTabStateLoadingCopyWith<$Res> {
  factory $UserListTabStateLoadingCopyWith(UserListTabStateLoading value,
          $Res Function(UserListTabStateLoading) then) =
      _$UserListTabStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserListTabStateLoadingCopyWithImpl<$Res>
    extends _$UserListTabStateCopyWithImpl<$Res>
    implements $UserListTabStateLoadingCopyWith<$Res> {
  _$UserListTabStateLoadingCopyWithImpl(UserListTabStateLoading _value,
      $Res Function(UserListTabStateLoading) _then)
      : super(_value, (v) => _then(v as UserListTabStateLoading));

  @override
  UserListTabStateLoading get _value => super._value as UserListTabStateLoading;
}

/// @nodoc
class _$UserListTabStateLoading
    with DiagnosticableTreeMixin
    implements UserListTabStateLoading {
  const _$UserListTabStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserListTabState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'UserListTabState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserListTabStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Matching> matchings), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Matching> matchings), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(UserListTabStateData value), {
    @required Result loading(UserListTabStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(UserListTabStateData value), {
    Result loading(UserListTabStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserListTabStateLoading implements UserListTabState {
  const factory UserListTabStateLoading() = _$UserListTabStateLoading;
}
