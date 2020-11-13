// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'EventJoinListState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EventJoinListStateTearOff {
  const _$EventJoinListStateTearOff();

// ignore: unused_element
  EventJoinListStateData call(
      {List<Event> events = const <Event>[],
      List<String> status = const <String>[]}) {
    return EventJoinListStateData(
      events: events,
      status: status,
    );
  }

// ignore: unused_element
  EventJoinListStateLoading loading() {
    return const EventJoinListStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $EventJoinListState = _$EventJoinListStateTearOff();

/// @nodoc
mixin _$EventJoinListState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events, List<String> status), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events, List<String> status), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(EventJoinListStateData value), {
    @required Result loading(EventJoinListStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventJoinListStateData value), {
    Result loading(EventJoinListStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $EventJoinListStateCopyWith<$Res> {
  factory $EventJoinListStateCopyWith(
          EventJoinListState value, $Res Function(EventJoinListState) then) =
      _$EventJoinListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventJoinListStateCopyWithImpl<$Res>
    implements $EventJoinListStateCopyWith<$Res> {
  _$EventJoinListStateCopyWithImpl(this._value, this._then);

  final EventJoinListState _value;
  // ignore: unused_field
  final $Res Function(EventJoinListState) _then;
}

/// @nodoc
abstract class $EventJoinListStateDataCopyWith<$Res> {
  factory $EventJoinListStateDataCopyWith(EventJoinListStateData value,
          $Res Function(EventJoinListStateData) then) =
      _$EventJoinListStateDataCopyWithImpl<$Res>;
  $Res call({List<Event> events, List<String> status});
}

/// @nodoc
class _$EventJoinListStateDataCopyWithImpl<$Res>
    extends _$EventJoinListStateCopyWithImpl<$Res>
    implements $EventJoinListStateDataCopyWith<$Res> {
  _$EventJoinListStateDataCopyWithImpl(EventJoinListStateData _value,
      $Res Function(EventJoinListStateData) _then)
      : super(_value, (v) => _then(v as EventJoinListStateData));

  @override
  EventJoinListStateData get _value => super._value as EventJoinListStateData;

  @override
  $Res call({
    Object events = freezed,
    Object status = freezed,
  }) {
    return _then(EventJoinListStateData(
      events: events == freezed ? _value.events : events as List<Event>,
      status: status == freezed ? _value.status : status as List<String>,
    ));
  }
}

/// @nodoc
class _$EventJoinListStateData
    with DiagnosticableTreeMixin
    implements EventJoinListStateData {
  const _$EventJoinListStateData(
      {this.events = const <Event>[], this.status = const <String>[]})
      : assert(events != null),
        assert(status != null);

  @JsonKey(defaultValue: const <Event>[])
  @override
  final List<Event> events;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventJoinListState(events: $events, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventJoinListState'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventJoinListStateData &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(status);

  @override
  $EventJoinListStateDataCopyWith<EventJoinListStateData> get copyWith =>
      _$EventJoinListStateDataCopyWithImpl<EventJoinListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events, List<String> status), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(events, status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events, List<String> status), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(events, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(EventJoinListStateData value), {
    @required Result loading(EventJoinListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventJoinListStateData value), {
    Result loading(EventJoinListStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class EventJoinListStateData implements EventJoinListState {
  const factory EventJoinListStateData(
      {List<Event> events, List<String> status}) = _$EventJoinListStateData;

  List<Event> get events;
  List<String> get status;
  $EventJoinListStateDataCopyWith<EventJoinListStateData> get copyWith;
}

/// @nodoc
abstract class $EventJoinListStateLoadingCopyWith<$Res> {
  factory $EventJoinListStateLoadingCopyWith(EventJoinListStateLoading value,
          $Res Function(EventJoinListStateLoading) then) =
      _$EventJoinListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventJoinListStateLoadingCopyWithImpl<$Res>
    extends _$EventJoinListStateCopyWithImpl<$Res>
    implements $EventJoinListStateLoadingCopyWith<$Res> {
  _$EventJoinListStateLoadingCopyWithImpl(EventJoinListStateLoading _value,
      $Res Function(EventJoinListStateLoading) _then)
      : super(_value, (v) => _then(v as EventJoinListStateLoading));

  @override
  EventJoinListStateLoading get _value =>
      super._value as EventJoinListStateLoading;
}

/// @nodoc
class _$EventJoinListStateLoading
    with DiagnosticableTreeMixin
    implements EventJoinListStateLoading {
  const _$EventJoinListStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventJoinListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EventJoinListState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EventJoinListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events, List<String> status), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events, List<String> status), {
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
    Result $default(EventJoinListStateData value), {
    @required Result loading(EventJoinListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventJoinListStateData value), {
    Result loading(EventJoinListStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EventJoinListStateLoading implements EventJoinListState {
  const factory EventJoinListStateLoading() = _$EventJoinListStateLoading;
}
