// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'Battle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BattleTearOff {
  const _$BattleTearOff();

// ignore: unused_element
  BattleData call(
      {String uid,
      String id,
      String title,
      String prize,
      String rule,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine}) {
    return BattleData(
      uid: uid,
      id: id,
      title: title,
      prize: prize,
      rule: rule,
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
const $Battle = _$BattleTearOff();

/// @nodoc
mixin _$Battle {
  String get uid; // 主催者
  String get id; // 大会ID
  String get title; // タイトル
  String get prize; // 賞品
  String get rule; // ルール
  String get game; // ゲーム
  bool get official; // 公式フラグ
  String get type; // イベント種別
  String get remarks; // 備考
  DateTime get timestamp; // 登録日
  DateTime get held; // 開催日
  DateTime get deadLine;

  $BattleCopyWith<Battle> get copyWith;
}

/// @nodoc
abstract class $BattleCopyWith<$Res> {
  factory $BattleCopyWith(Battle value, $Res Function(Battle) then) =
      _$BattleCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String id,
      String title,
      String prize,
      String rule,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine});
}

/// @nodoc
class _$BattleCopyWithImpl<$Res> implements $BattleCopyWith<$Res> {
  _$BattleCopyWithImpl(this._value, this._then);

  final Battle _value;
  // ignore: unused_field
  final $Res Function(Battle) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object id = freezed,
    Object title = freezed,
    Object prize = freezed,
    Object rule = freezed,
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
      prize: prize == freezed ? _value.prize : prize as String,
      rule: rule == freezed ? _value.rule : rule as String,
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
abstract class $BattleDataCopyWith<$Res> implements $BattleCopyWith<$Res> {
  factory $BattleDataCopyWith(
          BattleData value, $Res Function(BattleData) then) =
      _$BattleDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String id,
      String title,
      String prize,
      String rule,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine});
}

/// @nodoc
class _$BattleDataCopyWithImpl<$Res> extends _$BattleCopyWithImpl<$Res>
    implements $BattleDataCopyWith<$Res> {
  _$BattleDataCopyWithImpl(BattleData _value, $Res Function(BattleData) _then)
      : super(_value, (v) => _then(v as BattleData));

  @override
  BattleData get _value => super._value as BattleData;

  @override
  $Res call({
    Object uid = freezed,
    Object id = freezed,
    Object title = freezed,
    Object prize = freezed,
    Object rule = freezed,
    Object game = freezed,
    Object official = freezed,
    Object type = freezed,
    Object remarks = freezed,
    Object timestamp = freezed,
    Object held = freezed,
    Object deadLine = freezed,
  }) {
    return _then(BattleData(
      uid: uid == freezed ? _value.uid : uid as String,
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      prize: prize == freezed ? _value.prize : prize as String,
      rule: rule == freezed ? _value.rule : rule as String,
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
class _$BattleData with DiagnosticableTreeMixin implements BattleData {
  const _$BattleData(
      {this.uid,
      this.id,
      this.title,
      this.prize,
      this.rule,
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
  final String prize;
  @override // 賞品
  final String rule;
  @override // ルール
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
    return 'Battle(uid: $uid, id: $id, title: $title, prize: $prize, rule: $rule, game: $game, official: $official, type: $type, remarks: $remarks, timestamp: $timestamp, held: $held, deadLine: $deadLine)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Battle'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('prize', prize))
      ..add(DiagnosticsProperty('rule', rule))
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
        (other is BattleData &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.prize, prize) ||
                const DeepCollectionEquality().equals(other.prize, prize)) &&
            (identical(other.rule, rule) ||
                const DeepCollectionEquality().equals(other.rule, rule)) &&
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
      const DeepCollectionEquality().hash(prize) ^
      const DeepCollectionEquality().hash(rule) ^
      const DeepCollectionEquality().hash(game) ^
      const DeepCollectionEquality().hash(official) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(remarks) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(held) ^
      const DeepCollectionEquality().hash(deadLine);

  @override
  $BattleDataCopyWith<BattleData> get copyWith =>
      _$BattleDataCopyWithImpl<BattleData>(this, _$identity);
}

abstract class BattleData implements Battle {
  const factory BattleData(
      {String uid,
      String id,
      String title,
      String prize,
      String rule,
      String game,
      bool official,
      String type,
      String remarks,
      DateTime timestamp,
      DateTime held,
      DateTime deadLine}) = _$BattleData;

  @override
  String get uid;
  @override // 主催者
  String get id;
  @override // 大会ID
  String get title;
  @override // タイトル
  String get prize;
  @override // 賞品
  String get rule;
  @override // ルール
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
  $BattleDataCopyWith<BattleData> get copyWith;
}
