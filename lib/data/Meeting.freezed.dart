// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'Meeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MeetingTearOff {
  const _$MeetingTearOff();

// ignore: unused_element
  MeetingData call(
      {String uid,
      String id,
      String title,
      String content,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine}) {
    return MeetingData(
      uid: uid,
      id: id,
      title: title,
      content: content,
      game: game,
      official: official,
      type: type,
      remarks: remarks,
      timestamp: timestamp,
      held: held,
      deadLine: deadLine,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Meeting = _$MeetingTearOff();

/// @nodoc
mixin _$Meeting {
  String get uid; // 主催者
  String get id; // 大会ID
  String get title; // タイトル
  String get content; // 内容
  String get game; // ゲーム
  bool get official; // 公式フラグ
  String get type; // イベント種別
  String get remarks; // 備考
  DateTime get timestamp; // 登録日
  DateTime get held; // 開催日
  DateTime get deadLine;

  $MeetingCopyWith<Meeting> get copyWith;
}

/// @nodoc
abstract class $MeetingCopyWith<$Res> {
  factory $MeetingCopyWith(Meeting value, $Res Function(Meeting) then) =
      _$MeetingCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String id,
      String title,
      String content,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine});
}

/// @nodoc
class _$MeetingCopyWithImpl<$Res> implements $MeetingCopyWith<$Res> {
  _$MeetingCopyWithImpl(this._value, this._then);

  final Meeting _value;
  // ignore: unused_field
  final $Res Function(Meeting) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object id = freezed,
    Object title = freezed,
    Object content = freezed,
    Object game = freezed,
    Object official = freezed,
    Object type = freezed,
    Object remarks = freezed,
    Object timestamp = freezed,
    Object held = freezed,
    Object deadLine = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      game: game == freezed ? _value.game : game as String,
      official: official == freezed ? _value.official : official as bool,
      type: type == freezed ? _value.type : type as String,
      remarks: remarks == freezed ? _value.remarks : remarks as String,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
      held: held == freezed ? _value.held : held as DateTime,
      deadLine: deadLine == freezed ? _value.deadLine : deadLine as DateTime,
    ));
  }
}

/// @nodoc
abstract class $MeetingDataCopyWith<$Res> implements $MeetingCopyWith<$Res> {
  factory $MeetingDataCopyWith(
          MeetingData value, $Res Function(MeetingData) then) =
      _$MeetingDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String id,
      String title,
      String content,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine});
}

/// @nodoc
class _$MeetingDataCopyWithImpl<$Res> extends _$MeetingCopyWithImpl<$Res>
    implements $MeetingDataCopyWith<$Res> {
  _$MeetingDataCopyWithImpl(
      MeetingData _value, $Res Function(MeetingData) _then)
      : super(_value, (v) => _then(v as MeetingData));

  @override
  MeetingData get _value => super._value as MeetingData;

  @override
  $Res call({
    Object uid = freezed,
    Object id = freezed,
    Object title = freezed,
    Object content = freezed,
    Object game = freezed,
    Object official = freezed,
    Object type = freezed,
    Object remarks = freezed,
    Object timestamp = freezed,
    Object held = freezed,
    Object deadLine = freezed,
  }) {
    return _then(MeetingData(
      uid: uid == freezed ? _value.uid : uid as String,
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      content: content == freezed ? _value.content : content as String,
      game: game == freezed ? _value.game : game as String,
      official: official == freezed ? _value.official : official as bool,
      type: type == freezed ? _value.type : type as String,
      remarks: remarks == freezed ? _value.remarks : remarks as String,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as DateTime,
      held: held == freezed ? _value.held : held as DateTime,
      deadLine: deadLine == freezed ? _value.deadLine : deadLine as DateTime,
    ));
  }
}

/// @nodoc
class _$MeetingData with DiagnosticableTreeMixin implements MeetingData {
  const _$MeetingData(
      {this.uid,
      this.id,
      this.title,
      this.content,
      this.game,
      this.official,
      this.type,
      this.remarks,
      this.timestamp,
      this.held,
      this.deadLine});

  @override
  final String uid;
  @override // 主催者
  final String id;
  @override // 大会ID
  final String title;
  @override // タイトル
  final String content;
  @override // 内容
  final String game;
  @override // ゲーム
  final bool official;
  @override // 公式フラグ
  final String type;
  @override // イベント種別
  final String remarks;
  @override // 備考
  final DateTime timestamp;
  @override // 登録日
  final DateTime held;
  @override // 開催日
  final DateTime deadLine;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Meeting(uid: $uid, id: $id, title: $title, content: $content, game: $game, official: $official, type: $type, remarks: $remarks, timestamp: $timestamp, held: $held, deadLine: $deadLine)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Meeting'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('game', game))
      ..add(DiagnosticsProperty('official', official))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('remarks', remarks))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('held', held))
      ..add(DiagnosticsProperty('deadLine', deadLine));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MeetingData &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.game, game) ||
                const DeepCollectionEquality().equals(other.game, game)) &&
            (identical(other.official, official) ||
                const DeepCollectionEquality()
                    .equals(other.official, official)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.remarks, remarks) ||
                const DeepCollectionEquality()
                    .equals(other.remarks, remarks)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.held, held) ||
                const DeepCollectionEquality().equals(other.held, held)) &&
            (identical(other.deadLine, deadLine) ||
                const DeepCollectionEquality()
                    .equals(other.deadLine, deadLine)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(game) ^
      const DeepCollectionEquality().hash(official) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(held) ^
      const DeepCollectionEquality().hash(deadLine);

  @override
  $MeetingDataCopyWith<MeetingData> get copyWith =>
      _$MeetingDataCopyWithImpl<MeetingData>(this, _$identity);
}

abstract class MeetingData implements Meeting {
  const factory MeetingData(
      {String uid,
      String id,
      String title,
      String content,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine}) = _$MeetingData;

  @override
  String get uid;
  @override // 主催者
  String get id;
  @override // 大会ID
  String get title;
  @override // タイトル
  String get content;
  @override // 内容
  String get game;
  @override // ゲーム
  bool get official;
  @override // 公式フラグ
  String get type;
  @override // イベント種別
  String get remarks;
  @override // 備考
  DateTime get timestamp;
  @override // 登録日
  DateTime get held;
  @override // 開催日
  DateTime get deadLine;
  @override
  $MeetingDataCopyWith<MeetingData> get copyWith;
}
