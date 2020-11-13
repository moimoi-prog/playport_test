// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ShoutListState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoutListStateTearOff {
  const _$ShoutListStateTearOff();

// ignore: unused_element
  ShoutListStateData call(
      {List<ShoutDetailState> shouts = const <ShoutDetailState>[]}) {
    return ShoutListStateData(
      shouts: shouts,
    );
  }

// ignore: unused_element
  ShoutListStateLoading loading() {
    return const ShoutListStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $ShoutListState = _$ShoutListStateTearOff();

/// @nodoc
mixin _$ShoutListState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<ShoutDetailState> shouts), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<ShoutDetailState> shouts), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ShoutListStateData value), {
    @required Result loading(ShoutListStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutListStateData value), {
    Result loading(ShoutListStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ShoutListStateCopyWith<$Res> {
  factory $ShoutListStateCopyWith(
          ShoutListState value, $Res Function(ShoutListState) then) =
      _$ShoutListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoutListStateCopyWithImpl<$Res>
    implements $ShoutListStateCopyWith<$Res> {
  _$ShoutListStateCopyWithImpl(this._value, this._then);

  final ShoutListState _value;
  // ignore: unused_field
  final $Res Function(ShoutListState) _then;
}

/// @nodoc
abstract class $ShoutListStateDataCopyWith<$Res> {
  factory $ShoutListStateDataCopyWith(
          ShoutListStateData value, $Res Function(ShoutListStateData) then) =
      _$ShoutListStateDataCopyWithImpl<$Res>;
  $Res call({List<ShoutDetailState> shouts});
}

/// @nodoc
class _$ShoutListStateDataCopyWithImpl<$Res>
    extends _$ShoutListStateCopyWithImpl<$Res>
    implements $ShoutListStateDataCopyWith<$Res> {
  _$ShoutListStateDataCopyWithImpl(
      ShoutListStateData _value, $Res Function(ShoutListStateData) _then)
      : super(_value, (v) => _then(v as ShoutListStateData));

  @override
  ShoutListStateData get _value => super._value as ShoutListStateData;

  @override
  $Res call({
    Object shouts = freezed,
  }) {
    return _then(ShoutListStateData(
      shouts:
          shouts == freezed ? _value.shouts : shouts as List<ShoutDetailState>,
    ));
  }
}

/// @nodoc
class _$ShoutListStateData
    with DiagnosticableTreeMixin
    implements ShoutListStateData {
  const _$ShoutListStateData({this.shouts = const <ShoutDetailState>[]})
      : assert(shouts != null);

  @JsonKey(defaultValue: const <ShoutDetailState>[])
  @override
  final List<ShoutDetailState> shouts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoutListState(shouts: $shouts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoutListState'))
      ..add(DiagnosticsProperty('shouts', shouts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoutListStateData &&
            (identical(other.shouts, shouts) ||
                const DeepCollectionEquality().equals(other.shouts, shouts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(shouts);

  @override
  $ShoutListStateDataCopyWith<ShoutListStateData> get copyWith =>
      _$ShoutListStateDataCopyWithImpl<ShoutListStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<ShoutDetailState> shouts), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(shouts);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<ShoutDetailState> shouts), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(shouts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ShoutListStateData value), {
    @required Result loading(ShoutListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutListStateData value), {
    Result loading(ShoutListStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ShoutListStateData implements ShoutListState {
  const factory ShoutListStateData({List<ShoutDetailState> shouts}) =
      _$ShoutListStateData;

  List<ShoutDetailState> get shouts;
  $ShoutListStateDataCopyWith<ShoutListStateData> get copyWith;
}

/// @nodoc
abstract class $ShoutListStateLoadingCopyWith<$Res> {
  factory $ShoutListStateLoadingCopyWith(ShoutListStateLoading value,
          $Res Function(ShoutListStateLoading) then) =
      _$ShoutListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoutListStateLoadingCopyWithImpl<$Res>
    extends _$ShoutListStateCopyWithImpl<$Res>
    implements $ShoutListStateLoadingCopyWith<$Res> {
  _$ShoutListStateLoadingCopyWithImpl(
      ShoutListStateLoading _value, $Res Function(ShoutListStateLoading) _then)
      : super(_value, (v) => _then(v as ShoutListStateLoading));

  @override
  ShoutListStateLoading get _value => super._value as ShoutListStateLoading;
}

/// @nodoc
class _$ShoutListStateLoading
    with DiagnosticableTreeMixin
    implements ShoutListStateLoading {
  const _$ShoutListStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoutListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ShoutListState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShoutListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<ShoutDetailState> shouts), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<ShoutDetailState> shouts), {
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
    Result $default(ShoutListStateData value), {
    @required Result loading(ShoutListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutListStateData value), {
    Result loading(ShoutListStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoutListStateLoading implements ShoutListState {
  const factory ShoutListStateLoading() = _$ShoutListStateLoading;
}
