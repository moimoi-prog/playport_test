// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'EventListTabState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EventListTabStateTearOff {
  const _$EventListTabStateTearOff();

// ignore: unused_element
  EventListTabStateData call(
      {List<Event> events = const <Event>[], ScrollController controller}) {
    return EventListTabStateData(
      events: events,
      controller: controller,
    );
  }

// ignore: unused_element
  EventListTabStateLoading loading() {
    return const EventListTabStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $EventListTabState = _$EventListTabStateTearOff();

/// @nodoc
mixin _$EventListTabState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events, ScrollController controller), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events, ScrollController controller), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(EventListTabStateData value), {
    @required Result loading(EventListTabStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventListTabStateData value), {
    Result loading(EventListTabStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $EventListTabStateCopyWith<$Res> {
  factory $EventListTabStateCopyWith(
          EventListTabState value, $Res Function(EventListTabState) then) =
      _$EventListTabStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventListTabStateCopyWithImpl<$Res>
    implements $EventListTabStateCopyWith<$Res> {
  _$EventListTabStateCopyWithImpl(this._value, this._then);

  final EventListTabState _value;
  // ignore: unused_field
  final $Res Function(EventListTabState) _then;
}

/// @nodoc
abstract class $EventListTabStateDataCopyWith<$Res> {
  factory $EventListTabStateDataCopyWith(EventListTabStateData value,
          $Res Function(EventListTabStateData) then) =
      _$EventListTabStateDataCopyWithImpl<$Res>;
  $Res call({List<Event> events, ScrollController controller});
}

/// @nodoc
class _$EventListTabStateDataCopyWithImpl<$Res>
    extends _$EventListTabStateCopyWithImpl<$Res>
    implements $EventListTabStateDataCopyWith<$Res> {
  _$EventListTabStateDataCopyWithImpl(
      EventListTabStateData _value, $Res Function(EventListTabStateData) _then)
      : super(_value, (v) => _then(v as EventListTabStateData));

  @override
  EventListTabStateData get _value => super._value as EventListTabStateData;

  @override
  $Res call({
    Object events = freezed,
    Object controller = freezed,
  }) {
    return _then(EventListTabStateData(
      events: events == freezed ? _value.events : events as List<Event>,
      controller: controller == freezed
          ? _value.controller
          : controller as ScrollController,
    ));
  }
}

/// @nodoc
class _$EventListTabStateData
    with DiagnosticableTreeMixin
    implements EventListTabStateData {
  const _$EventListTabStateData(
      {this.events = const <Event>[], this.controller})
      : assert(events != null);

  @JsonKey(defaultValue: const <Event>[])
  @override
  final List<Event> events;
  @override
  final ScrollController controller;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventListTabState(events: $events, controller: $controller)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventListTabState'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('controller', controller));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventListTabStateData &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)) &&
            (identical(other.controller, controller) ||
                const DeepCollectionEquality()
                    .equals(other.controller, controller)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(events) ^
      const DeepCollectionEquality().hash(controller);

  @override
  $EventListTabStateDataCopyWith<EventListTabStateData> get copyWith =>
      _$EventListTabStateDataCopyWithImpl<EventListTabStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events, ScrollController controller), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(events, controller);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events, ScrollController controller), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(events, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(EventListTabStateData value), {
    @required Result loading(EventListTabStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventListTabStateData value), {
    Result loading(EventListTabStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class EventListTabStateData implements EventListTabState {
  const factory EventListTabStateData(
      {List<Event> events,
      ScrollController controller}) = _$EventListTabStateData;

  List<Event> get events;
  ScrollController get controller;
  $EventListTabStateDataCopyWith<EventListTabStateData> get copyWith;
}

/// @nodoc
abstract class $EventListTabStateLoadingCopyWith<$Res> {
  factory $EventListTabStateLoadingCopyWith(EventListTabStateLoading value,
          $Res Function(EventListTabStateLoading) then) =
      _$EventListTabStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventListTabStateLoadingCopyWithImpl<$Res>
    extends _$EventListTabStateCopyWithImpl<$Res>
    implements $EventListTabStateLoadingCopyWith<$Res> {
  _$EventListTabStateLoadingCopyWithImpl(EventListTabStateLoading _value,
      $Res Function(EventListTabStateLoading) _then)
      : super(_value, (v) => _then(v as EventListTabStateLoading));

  @override
  EventListTabStateLoading get _value =>
      super._value as EventListTabStateLoading;
}

/// @nodoc
class _$EventListTabStateLoading
    with DiagnosticableTreeMixin
    implements EventListTabStateLoading {
  const _$EventListTabStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventListTabState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EventListTabState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EventListTabStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<Event> events, ScrollController controller), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<Event> events, ScrollController controller), {
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
    Result $default(EventListTabStateData value), {
    @required Result loading(EventListTabStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(EventListTabStateData value), {
    Result loading(EventListTabStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EventListTabStateLoading implements EventListTabState {
  const factory EventListTabStateLoading() = _$EventListTabStateLoading;
}
