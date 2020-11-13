// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ShoutDetailPageState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoutDetailPageStateTearOff {
  const _$ShoutDetailPageStateTearOff();

// ignore: unused_element
  ShoutDetailPageStateData call(
      {List<CommentData> comments = const <CommentData>[]}) {
    return ShoutDetailPageStateData(
      comments: comments,
    );
  }

// ignore: unused_element
  ShoutDetailPageStateLoading loading() {
    return const ShoutDetailPageStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $ShoutDetailPageState = _$ShoutDetailPageStateTearOff();

/// @nodoc
mixin _$ShoutDetailPageState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<CommentData> comments), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<CommentData> comments), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ShoutDetailPageStateData value), {
    @required Result loading(ShoutDetailPageStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutDetailPageStateData value), {
    Result loading(ShoutDetailPageStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ShoutDetailPageStateCopyWith<$Res> {
  factory $ShoutDetailPageStateCopyWith(ShoutDetailPageState value,
          $Res Function(ShoutDetailPageState) then) =
      _$ShoutDetailPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoutDetailPageStateCopyWithImpl<$Res>
    implements $ShoutDetailPageStateCopyWith<$Res> {
  _$ShoutDetailPageStateCopyWithImpl(this._value, this._then);

  final ShoutDetailPageState _value;
  // ignore: unused_field
  final $Res Function(ShoutDetailPageState) _then;
}

/// @nodoc
abstract class $ShoutDetailPageStateDataCopyWith<$Res> {
  factory $ShoutDetailPageStateDataCopyWith(ShoutDetailPageStateData value,
          $Res Function(ShoutDetailPageStateData) then) =
      _$ShoutDetailPageStateDataCopyWithImpl<$Res>;
  $Res call({List<CommentData> comments});
}

/// @nodoc
class _$ShoutDetailPageStateDataCopyWithImpl<$Res>
    extends _$ShoutDetailPageStateCopyWithImpl<$Res>
    implements $ShoutDetailPageStateDataCopyWith<$Res> {
  _$ShoutDetailPageStateDataCopyWithImpl(ShoutDetailPageStateData _value,
      $Res Function(ShoutDetailPageStateData) _then)
      : super(_value, (v) => _then(v as ShoutDetailPageStateData));

  @override
  ShoutDetailPageStateData get _value =>
      super._value as ShoutDetailPageStateData;

  @override
  $Res call({
    Object comments = freezed,
  }) {
    return _then(ShoutDetailPageStateData(
      comments:
          comments == freezed ? _value.comments : comments as List<CommentData>,
    ));
  }
}

/// @nodoc
class _$ShoutDetailPageStateData
    with DiagnosticableTreeMixin
    implements ShoutDetailPageStateData {
  const _$ShoutDetailPageStateData({this.comments = const <CommentData>[]})
      : assert(comments != null);

  @JsonKey(defaultValue: const <CommentData>[])
  @override
  final List<CommentData> comments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoutDetailPageState(comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoutDetailPageState'))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoutDetailPageStateData &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(comments);

  @override
  $ShoutDetailPageStateDataCopyWith<ShoutDetailPageStateData> get copyWith =>
      _$ShoutDetailPageStateDataCopyWithImpl<ShoutDetailPageStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<CommentData> comments), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(comments);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<CommentData> comments), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(ShoutDetailPageStateData value), {
    @required Result loading(ShoutDetailPageStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutDetailPageStateData value), {
    Result loading(ShoutDetailPageStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ShoutDetailPageStateData implements ShoutDetailPageState {
  const factory ShoutDetailPageStateData({List<CommentData> comments}) =
      _$ShoutDetailPageStateData;

  List<CommentData> get comments;
  $ShoutDetailPageStateDataCopyWith<ShoutDetailPageStateData> get copyWith;
}

/// @nodoc
abstract class $ShoutDetailPageStateLoadingCopyWith<$Res> {
  factory $ShoutDetailPageStateLoadingCopyWith(
          ShoutDetailPageStateLoading value,
          $Res Function(ShoutDetailPageStateLoading) then) =
      _$ShoutDetailPageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoutDetailPageStateLoadingCopyWithImpl<$Res>
    extends _$ShoutDetailPageStateCopyWithImpl<$Res>
    implements $ShoutDetailPageStateLoadingCopyWith<$Res> {
  _$ShoutDetailPageStateLoadingCopyWithImpl(ShoutDetailPageStateLoading _value,
      $Res Function(ShoutDetailPageStateLoading) _then)
      : super(_value, (v) => _then(v as ShoutDetailPageStateLoading));

  @override
  ShoutDetailPageStateLoading get _value =>
      super._value as ShoutDetailPageStateLoading;
}

/// @nodoc
class _$ShoutDetailPageStateLoading
    with DiagnosticableTreeMixin
    implements ShoutDetailPageStateLoading {
  const _$ShoutDetailPageStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoutDetailPageState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoutDetailPageState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShoutDetailPageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<CommentData> comments), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<CommentData> comments), {
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
    Result $default(ShoutDetailPageStateData value), {
    @required Result loading(ShoutDetailPageStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(ShoutDetailPageStateData value), {
    Result loading(ShoutDetailPageStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoutDetailPageStateLoading implements ShoutDetailPageState {
  const factory ShoutDetailPageStateLoading() = _$ShoutDetailPageStateLoading;
}
