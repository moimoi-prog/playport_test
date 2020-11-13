// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'MessageTabState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MessageTabStateTearOff {
  const _$MessageTabStateTearOff();

// ignore: unused_element
  MessageTabStateData call(
      {List<MessageDetail> messages = const <MessageDetail>[]}) {
    return MessageTabStateData(
      messages: messages,
    );
  }

// ignore: unused_element
  MessageTabStateLoading loading() {
    return const MessageTabStateLoading();
  }
}

/// @nodoc
// ignore: unused_element
const $MessageTabState = _$MessageTabStateTearOff();

/// @nodoc
mixin _$MessageTabState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<MessageDetail> messages), {
    @required Result loading(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<MessageDetail> messages), {
    Result loading(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(MessageTabStateData value), {
    @required Result loading(MessageTabStateLoading value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(MessageTabStateData value), {
    Result loading(MessageTabStateLoading value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $MessageTabStateCopyWith<$Res> {
  factory $MessageTabStateCopyWith(
          MessageTabState value, $Res Function(MessageTabState) then) =
      _$MessageTabStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageTabStateCopyWithImpl<$Res>
    implements $MessageTabStateCopyWith<$Res> {
  _$MessageTabStateCopyWithImpl(this._value, this._then);

  final MessageTabState _value;
  // ignore: unused_field
  final $Res Function(MessageTabState) _then;
}

/// @nodoc
abstract class $MessageTabStateDataCopyWith<$Res> {
  factory $MessageTabStateDataCopyWith(
          MessageTabStateData value, $Res Function(MessageTabStateData) then) =
      _$MessageTabStateDataCopyWithImpl<$Res>;
  $Res call({List<MessageDetail> messages});
}

/// @nodoc
class _$MessageTabStateDataCopyWithImpl<$Res>
    extends _$MessageTabStateCopyWithImpl<$Res>
    implements $MessageTabStateDataCopyWith<$Res> {
  _$MessageTabStateDataCopyWithImpl(
      MessageTabStateData _value, $Res Function(MessageTabStateData) _then)
      : super(_value, (v) => _then(v as MessageTabStateData));

  @override
  MessageTabStateData get _value => super._value as MessageTabStateData;

  @override
  $Res call({
    Object messages = freezed,
  }) {
    return _then(MessageTabStateData(
      messages: messages == freezed
          ? _value.messages
          : messages as List<MessageDetail>,
    ));
  }
}

/// @nodoc
class _$MessageTabStateData
    with DiagnosticableTreeMixin
    implements MessageTabStateData {
  const _$MessageTabStateData({this.messages = const <MessageDetail>[]})
      : assert(messages != null);

  @JsonKey(defaultValue: const <MessageDetail>[])
  @override
  final List<MessageDetail> messages;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageTabState(messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageTabState'))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageTabStateData &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @override
  $MessageTabStateDataCopyWith<MessageTabStateData> get copyWith =>
      _$MessageTabStateDataCopyWithImpl<MessageTabStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<MessageDetail> messages), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(messages);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<MessageDetail> messages), {
    Result loading(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(MessageTabStateData value), {
    @required Result loading(MessageTabStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(MessageTabStateData value), {
    Result loading(MessageTabStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MessageTabStateData implements MessageTabState {
  const factory MessageTabStateData({List<MessageDetail> messages}) =
      _$MessageTabStateData;

  List<MessageDetail> get messages;
  $MessageTabStateDataCopyWith<MessageTabStateData> get copyWith;
}

/// @nodoc
abstract class $MessageTabStateLoadingCopyWith<$Res> {
  factory $MessageTabStateLoadingCopyWith(MessageTabStateLoading value,
          $Res Function(MessageTabStateLoading) then) =
      _$MessageTabStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MessageTabStateLoadingCopyWithImpl<$Res>
    extends _$MessageTabStateCopyWithImpl<$Res>
    implements $MessageTabStateLoadingCopyWith<$Res> {
  _$MessageTabStateLoadingCopyWithImpl(MessageTabStateLoading _value,
      $Res Function(MessageTabStateLoading) _then)
      : super(_value, (v) => _then(v as MessageTabStateLoading));

  @override
  MessageTabStateLoading get _value => super._value as MessageTabStateLoading;
}

/// @nodoc
class _$MessageTabStateLoading
    with DiagnosticableTreeMixin
    implements MessageTabStateLoading {
  const _$MessageTabStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageTabState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MessageTabState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MessageTabStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(List<MessageDetail> messages), {
    @required Result loading(),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(List<MessageDetail> messages), {
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
    Result $default(MessageTabStateData value), {
    @required Result loading(MessageTabStateLoading value),
  }) {
    assert($default != null);
    assert(loading != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(MessageTabStateData value), {
    Result loading(MessageTabStateLoading value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MessageTabStateLoading implements MessageTabState {
  const factory MessageTabStateLoading() = _$MessageTabStateLoading;
}
