// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'EventHeldListState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EventHeldListStateTearOff {
  const _$EventHeldListStateTearOff();

// ignore: unused_element
  EventHeldListStateData call({List<Event> events = const <Event>[]}) {
    return EventHeldListStateData(
      events: events,
    );
  }

// ignore: unused_element
  EventHeldListStateLoading loading() {
    return const EventHeldListStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $EventHeldListState = _$EventHeldListStateTearOff();

/// @nodoc
mixin _$EventHeldListState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(EventHeldListStateData value), {
    @required Result loading(EventHeldListStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventHeldListStateData value), {
    Result loading(EventHeldListStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $EventHeldListStateCopyWith<$Res> {
  factory $EventHeldListStateCopyWith(
          EventHeldListState value, $Res Function(EventHeldListState) then) =
      _$EventHeldListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventHeldListStateCopyWithImpl<$Res>
    implements $EventHeldListStateCopyWith<$Res> {
  _$EventHeldListStateCopyWithImpl(this._value, this._then);

  final EventHeldListState _value;
  // ignore: unused_field
  final $Res Function(EventHeldListState) _then;
}

/// @nodoc
abstract class $EventHeldListStateDataCopyWith<$Res> {
  factory $EventHeldListStateDataCopyWith(EventHeldListStateData value,
          $Res Function(EventHeldListStateData) then) =
      _$EventHeldListStateDataCopyWithImpl<$Res>;
  $Res call({List<Event> events});
}

/// @nodoc
class _$EventHeldListStateDataCopyWithImpl<$Res>
    extends _$EventHeldListStateCopyWithImpl<$Res>
    implements $EventHeldListStateDataCopyWith<$Res> {
  _$EventHeldListStateDataCopyWithImpl(EventHeldListStateData _value,
      $Res Function(EventHeldListStateData) _then)
      : super(_value, (v) => _then(v as EventHeldListStateData));

  @override
  EventHeldListStateData get _value => super._value as EventHeldListStateData;

  @override
  $Res call({
    Object events = freezed,
  }) {
    return _then(EventHeldListStateData(
      events: events == freezed ? _value.events : events as List<Event>,
    ));
  }
}

/// @nodoc
class _$EventHeldListStateData
    with DiagnosticableTreeMixin
    implements EventHeldListStateData {
  const _$EventHeldListStateData({this.events = const <Event>[]})
      : assert(events != null);

  @JsonKey(defaultValue: const <Event>[])
  @override
  final List<Event> events;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventHeldListState(events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventHeldListState'))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventHeldListStateData &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(events);

  @override
  $EventHeldListStateDataCopyWith<EventHeldListStateData> get copyWith =>
      _$EventHeldListStateDataCopyWithImpl<EventHeldListStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(events);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(events);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(EventHeldListStateData value), {
    @required Result loading(EventHeldListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventHeldListStateData value), {
    Result loading(EventHeldListStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class EventHeldListStateData implements EventHeldListState {
  const factory EventHeldListStateData({List<Event> events}) =
      _$EventHeldListStateData;

  List<Event> get events;
  $EventHeldListStateDataCopyWith<EventHeldListStateData> get copyWith;
}

/// @nodoc
abstract class $EventHeldListStateLoadingCopyWith<$Res> {
  factory $EventHeldListStateLoadingCopyWith(EventHeldListStateLoading value,
          $Res Function(EventHeldListStateLoading) then) =
      _$EventHeldListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventHeldListStateLoadingCopyWithImpl<$Res>
    extends _$EventHeldListStateCopyWithImpl<$Res>
    implements $EventHeldListStateLoadingCopyWith<$Res> {
  _$EventHeldListStateLoadingCopyWithImpl(EventHeldListStateLoading _value,
      $Res Function(EventHeldListStateLoading) _then)
      : super(_value, (v) => _then(v as EventHeldListStateLoading));

  @override
  EventHeldListStateLoading get _value =>
      super._value as EventHeldListStateLoading;
}

/// @nodoc
class _$EventHeldListStateLoading
    with DiagnosticableTreeMixin
    implements EventHeldListStateLoading {
  const _$EventHeldListStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventHeldListState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EventHeldListState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EventHeldListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events), {
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
    Result $default(EventHeldListStateData value), {
    @required Result loading(EventHeldListStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventHeldListStateData value), {
    Result loading(EventHeldListStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EventHeldListStateLoading implements EventHeldListState {
  const factory EventHeldListStateLoading() = _$EventHeldListStateLoading;
}
