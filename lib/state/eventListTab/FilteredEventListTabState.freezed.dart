// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'FilteredEventListTabState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FilteredEventListTabStateTearOff {
  const _$FilteredEventListTabStateTearOff();

// ignore: unused_element
  FilteredEventListTabStateData call(
      {bool completed = false, List<Event> events = const <Event>[]}) {
    return FilteredEventListTabStateData(
      completed: completed,
      events: events,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FilteredEventListTabState = _$FilteredEventListTabStateTearOff();

/// @nodoc
mixin _$FilteredEventListTabState {
  bool get completed;
  List<Event> get events;

  $FilteredEventListTabStateCopyWith<FilteredEventListTabState> get copyWith;
}

/// @nodoc
abstract class $FilteredEventListTabStateCopyWith<$Res> {
  factory $FilteredEventListTabStateCopyWith(FilteredEventListTabState value,
          $Res Function(FilteredEventListTabState) then) =
      _$FilteredEventListTabStateCopyWithImpl<$Res>;
  $Res call({bool completed, List<Event> events});
}

/// @nodoc
class _$FilteredEventListTabStateCopyWithImpl<$Res>
    implements $FilteredEventListTabStateCopyWith<$Res> {
  _$FilteredEventListTabStateCopyWithImpl(this._value, this._then);

  final FilteredEventListTabState _value;
  // ignore: unused_field
  final $Res Function(FilteredEventListTabState) _then;

  @override
  $Res call({
    Object completed = freezed,
    Object events = freezed,
  }) {
    return _then(_value.copyWith(
      completed: completed == freezed ? _value.completed : completed as bool,
      events: events == freezed ? _value.events : events as List<Event>,
    ));
  }
}

/// @nodoc
abstract class $FilteredEventListTabStateDataCopyWith<$Res>
    implements $FilteredEventListTabStateCopyWith<$Res> {
  factory $FilteredEventListTabStateDataCopyWith(
          FilteredEventListTabStateData value,
          $Res Function(FilteredEventListTabStateData) then) =
      _$FilteredEventListTabStateDataCopyWithImpl<$Res>;
  @override
  $Res call({bool completed, List<Event> events});
}

/// @nodoc
class _$FilteredEventListTabStateDataCopyWithImpl<$Res>
    extends _$FilteredEventListTabStateCopyWithImpl<$Res>
    implements $FilteredEventListTabStateDataCopyWith<$Res> {
  _$FilteredEventListTabStateDataCopyWithImpl(
      FilteredEventListTabStateData _value,
      $Res Function(FilteredEventListTabStateData) _then)
      : super(_value, (v) => _then(v as FilteredEventListTabStateData));

  @override
  FilteredEventListTabStateData get _value =>
      super._value as FilteredEventListTabStateData;

  @override
  $Res call({
    Object completed = freezed,
    Object events = freezed,
  }) {
    return _then(FilteredEventListTabStateData(
      completed: completed == freezed ? _value.completed : completed as bool,
      events: events == freezed ? _value.events : events as List<Event>,
    ));
  }
}

/// @nodoc
class _$FilteredEventListTabStateData
    with DiagnosticableTreeMixin
    implements FilteredEventListTabStateData {
  const _$FilteredEventListTabStateData(
      {this.completed = false, this.events = const <Event>[]})
      : assert(completed != null),
        assert(events != null);

  @JsonKey(defaultValue: false)
  @override
  final bool completed;
  @JsonKey(defaultValue: const <Event>[])
  @override
  final List<Event> events;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FilteredEventListTabState(completed: $completed, events: $events)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FilteredEventListTabState'))
      ..add(DiagnosticsProperty('completed', completed))
      ..add(DiagnosticsProperty('events', events));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilteredEventListTabStateData &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(completed) ^
      const DeepCollectionEquality().hash(events);

  @override
  $FilteredEventListTabStateDataCopyWith<FilteredEventListTabStateData>
      get copyWith => _$FilteredEventListTabStateDataCopyWithImpl<
          FilteredEventListTabStateData>(this, _$identity);
}

abstract class FilteredEventListTabStateData
    implements FilteredEventListTabState {
  const factory FilteredEventListTabStateData(
      {bool completed, List<Event> events}) = _$FilteredEventListTabStateData;

  @override
  bool get completed;
  @override
  List<Event> get events;
  @override
  $FilteredEventListTabStateDataCopyWith<FilteredEventListTabStateData>
      get copyWith;
}
