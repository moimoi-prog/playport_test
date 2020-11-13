// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ShoutDetailState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoutDetailStateTearOff {
  const _$ShoutDetailStateTearOff();

// ignore: unused_element
  ShoutDetailStateData call(
      {String id,
      String uid,
      String userImagePath,
      String userName,
      String shoutDetail,
      List<String> shoutImageList = const [],
      List<String> shoutMovieList = const [],
      List<String> shoutTagList = const [],
      DateTime shoutTimeStamp,
      int shoutFavorite = 0,
      int shoutComments = 0}) {
    return ShoutDetailStateData(
      id: id,
      uid: uid,
      userImagePath: userImagePath,
      userName: userName,
      shoutDetail: shoutDetail,
      shoutImageList: shoutImageList,
      shoutMovieList: shoutMovieList,
      shoutTagList: shoutTagList,
      shoutTimeStamp: shoutTimeStamp,
      shoutFavorite: shoutFavorite,
      shoutComments: shoutComments,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ShoutDetailState = _$ShoutDetailStateTearOff();

/// @nodoc
mixin _$ShoutDetailState {
  String get id; // 投稿ID
  String get uid; // 投稿ユーザーID
  String get userImagePath; // 投稿ユーザーイメージパス
  String get userName; // 投稿ユーザー名
  String get shoutDetail; // 投稿内容(文章)
  List<String> get shoutImageList; // 投稿内容(画像)
  List<String> get shoutMovieList; // 投稿内容(動画)
  List<String> get shoutTagList; // 投稿タグ
  DateTime get shoutTimeStamp; // 投稿日時
  int get shoutFavorite; // いいね数
  int get shoutComments;

  $ShoutDetailStateCopyWith<ShoutDetailState> get copyWith;
}

/// @nodoc
abstract class $ShoutDetailStateCopyWith<$Res> {
  factory $ShoutDetailStateCopyWith(
          ShoutDetailState value, $Res Function(ShoutDetailState) then) =
      _$ShoutDetailStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String uid,
      String userImagePath,
      String userName,
      String shoutDetail,
      List<String> shoutImageList,
      List<String> shoutMovieList,
      List<String> shoutTagList,
      DateTime shoutTimeStamp,
      int shoutFavorite,
      int shoutComments});
}

/// @nodoc
class _$ShoutDetailStateCopyWithImpl<$Res>
    implements $ShoutDetailStateCopyWith<$Res> {
  _$ShoutDetailStateCopyWithImpl(this._value, this._then);

  final ShoutDetailState _value;
  // ignore: unused_field
  final $Res Function(ShoutDetailState) _then;

  @override
  $Res call({
    Object id = freezed,
    Object uid = freezed,
    Object userImagePath = freezed,
    Object userName = freezed,
    Object shoutDetail = freezed,
    Object shoutImageList = freezed,
    Object shoutMovieList = freezed,
    Object shoutTagList = freezed,
    Object shoutTimeStamp = freezed,
    Object shoutFavorite = freezed,
    Object shoutComments = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      uid: uid == freezed ? _value.uid : uid as String,
      userImagePath: userImagePath == freezed
          ? _value.userImagePath
          : userImagePath as String,
      userName: userName == freezed ? _value.userName : userName as String,
      shoutDetail:
          shoutDetail == freezed ? _value.shoutDetail : shoutDetail as String,
      shoutImageList: shoutImageList == freezed
          ? _value.shoutImageList
          : shoutImageList as List<String>,
      shoutMovieList: shoutMovieList == freezed
          ? _value.shoutMovieList
          : shoutMovieList as List<String>,
      shoutTagList: shoutTagList == freezed
          ? _value.shoutTagList
          : shoutTagList as List<String>,
      shoutTimeStamp: shoutTimeStamp == freezed
          ? _value.shoutTimeStamp
          : shoutTimeStamp as DateTime,
      shoutFavorite: shoutFavorite == freezed
          ? _value.shoutFavorite
          : shoutFavorite as int,
      shoutComments: shoutComments == freezed
          ? _value.shoutComments
          : shoutComments as int,
    ));
  }
}

/// @nodoc
abstract class $ShoutDetailStateDataCopyWith<$Res>
    implements $ShoutDetailStateCopyWith<$Res> {
  factory $ShoutDetailStateDataCopyWith(ShoutDetailStateData value,
          $Res Function(ShoutDetailStateData) then) =
      _$ShoutDetailStateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String uid,
      String userImagePath,
      String userName,
      String shoutDetail,
      List<String> shoutImageList,
      List<String> shoutMovieList,
      List<String> shoutTagList,
      DateTime shoutTimeStamp,
      int shoutFavorite,
      int shoutComments});
}

/// @nodoc
class _$ShoutDetailStateDataCopyWithImpl<$Res>
    extends _$ShoutDetailStateCopyWithImpl<$Res>
    implements $ShoutDetailStateDataCopyWith<$Res> {
  _$ShoutDetailStateDataCopyWithImpl(
      ShoutDetailStateData _value, $Res Function(ShoutDetailStateData) _then)
      : super(_value, (v) => _then(v as ShoutDetailStateData));

  @override
  ShoutDetailStateData get _value => super._value as ShoutDetailStateData;

  @override
  $Res call({
    Object id = freezed,
    Object uid = freezed,
    Object userImagePath = freezed,
    Object userName = freezed,
    Object shoutDetail = freezed,
    Object shoutImageList = freezed,
    Object shoutMovieList = freezed,
    Object shoutTagList = freezed,
    Object shoutTimeStamp = freezed,
    Object shoutFavorite = freezed,
    Object shoutComments = freezed,
  }) {
    return _then(ShoutDetailStateData(
      id: id == freezed ? _value.id : id as String,
      uid: uid == freezed ? _value.uid : uid as String,
      userImagePath: userImagePath == freezed
          ? _value.userImagePath
          : userImagePath as String,
      userName: userName == freezed ? _value.userName : userName as String,
      shoutDetail:
          shoutDetail == freezed ? _value.shoutDetail : shoutDetail as String,
      shoutImageList: shoutImageList == freezed
          ? _value.shoutImageList
          : shoutImageList as List<String>,
      shoutMovieList: shoutMovieList == freezed
          ? _value.shoutMovieList
          : shoutMovieList as List<String>,
      shoutTagList: shoutTagList == freezed
          ? _value.shoutTagList
          : shoutTagList as List<String>,
      shoutTimeStamp: shoutTimeStamp == freezed
          ? _value.shoutTimeStamp
          : shoutTimeStamp as DateTime,
      shoutFavorite: shoutFavorite == freezed
          ? _value.shoutFavorite
          : shoutFavorite as int,
      shoutComments: shoutComments == freezed
          ? _value.shoutComments
          : shoutComments as int,
    ));
  }
}

/// @nodoc
class _$ShoutDetailStateData
    with DiagnosticableTreeMixin
    implements ShoutDetailStateData {
  const _$ShoutDetailStateData(
      {this.id,
      this.uid,
      this.userImagePath,
      this.userName,
      this.shoutDetail,
      this.shoutImageList = const [],
      this.shoutMovieList = const [],
      this.shoutTagList = const [],
      this.shoutTimeStamp,
      this.shoutFavorite = 0,
      this.shoutComments = 0})
      : assert(shoutImageList != null),
        assert(shoutMovieList != null),
        assert(shoutTagList != null),
        assert(shoutFavorite != null),
        assert(shoutComments != null);

  @override
  final String id;
  @override // 投稿ID
  final String uid;
  @override // 投稿ユーザーID
  final String userImagePath;
  @override // 投稿ユーザーイメージパス
  final String userName;
  @override // 投稿ユーザー名
  final String shoutDetail;
  @JsonKey(defaultValue: const [])
  @override // 投稿内容(文章)
  final List<String> shoutImageList;
  @JsonKey(defaultValue: const [])
  @override // 投稿内容(画像)
  final List<String> shoutMovieList;
  @JsonKey(defaultValue: const [])
  @override // 投稿内容(動画)
  final List<String> shoutTagList;
  @override // 投稿タグ
  final DateTime shoutTimeStamp;
  @JsonKey(defaultValue: 0)
  @override // 投稿日時
  final int shoutFavorite;
  @JsonKey(defaultValue: 0)
  @override // いいね数
  final int shoutComments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShoutDetailState(id: $id, uid: $uid, userImagePath: $userImagePath, userName: $userName, shoutDetail: $shoutDetail, shoutImageList: $shoutImageList, shoutMovieList: $shoutMovieList, shoutTagList: $shoutTagList, shoutTimeStamp: $shoutTimeStamp, shoutFavorite: $shoutFavorite, shoutComments: $shoutComments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShoutDetailState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('userImagePath', userImagePath))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('shoutDetail', shoutDetail))
      ..add(DiagnosticsProperty('shoutImageList', shoutImageList))
      ..add(DiagnosticsProperty('shoutMovieList', shoutMovieList))
      ..add(DiagnosticsProperty('shoutTagList', shoutTagList))
      ..add(DiagnosticsProperty('shoutTimeStamp', shoutTimeStamp))
      ..add(DiagnosticsProperty('shoutFavorite', shoutFavorite))
      ..add(DiagnosticsProperty('shoutComments', shoutComments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoutDetailStateData &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.userImagePath, userImagePath) ||
                const DeepCollectionEquality()
                    .equals(other.userImagePath, userImagePath)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.shoutDetail, shoutDetail) ||
                const DeepCollectionEquality()
                    .equals(other.shoutDetail, shoutDetail)) &&
            (identical(other.shoutImageList, shoutImageList) ||
                const DeepCollectionEquality()
                    .equals(other.shoutImageList, shoutImageList)) &&
            (identical(other.shoutMovieList, shoutMovieList) ||
                const DeepCollectionEquality()
                    .equals(other.shoutMovieList, shoutMovieList)) &&
            (identical(other.shoutTagList, shoutTagList) ||
                const DeepCollectionEquality()
                    .equals(other.shoutTagList, shoutTagList)) &&
            (identical(other.shoutTimeStamp, shoutTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.shoutTimeStamp, shoutTimeStamp)) &&
            (identical(other.shoutFavorite, shoutFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.shoutFavorite, shoutFavorite)) &&
            (identical(other.shoutComments, shoutComments) ||
                const DeepCollectionEquality()
                    .equals(other.shoutComments, shoutComments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(userImagePath) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(shoutDetail) ^
      const DeepCollectionEquality().hash(shoutImageList) ^
      const DeepCollectionEquality().hash(shoutMovieList) ^
      const DeepCollectionEquality().hash(shoutTagList) ^
      const DeepCollectionEquality().hash(shoutTimeStamp) ^
      const DeepCollectionEquality().hash(shoutFavorite) ^
      const DeepCollectionEquality().hash(shoutComments);

  @override
  $ShoutDetailStateDataCopyWith<ShoutDetailStateData> get copyWith =>
      _$ShoutDetailStateDataCopyWithImpl<ShoutDetailStateData>(
          this, _$identity);
}

abstract class ShoutDetailStateData implements ShoutDetailState {
  const factory ShoutDetailStateData(
      {String id,
      String uid,
      String userImagePath,
      String userName,
      String shoutDetail,
      List<String> shoutImageList,
      List<String> shoutMovieList,
      List<String> shoutTagList,
      DateTime shoutTimeStamp,
      int shoutFavorite,
      int shoutComments}) = _$ShoutDetailStateData;

  @override
  String get id;
  @override // 投稿ID
  String get uid;
  @override // 投稿ユーザーID
  String get userImagePath;
  @override // 投稿ユーザーイメージパス
  String get userName;
  @override // 投稿ユーザー名
  String get shoutDetail;
  @override // 投稿内容(文章)
  List<String> get shoutImageList;
  @override // 投稿内容(画像)
  List<String> get shoutMovieList;
  @override // 投稿内容(動画)
  List<String> get shoutTagList;
  @override // 投稿タグ
  DateTime get shoutTimeStamp;
  @override // 投稿日時
  int get shoutFavorite;
  @override // いいね数
  int get shoutComments;
  @override
  $ShoutDetailStateDataCopyWith<ShoutDetailStateData> get copyWith;
}
