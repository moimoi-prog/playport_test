import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ShoutDetailState.freezed.dart';

@freezed
abstract class ShoutDetailState with _$ShoutDetailState {
  const factory ShoutDetailState({
    String id, // 投稿ID
    String uid, // 投稿ユーザーID
    String userImagePath, // 投稿ユーザーイメージパス
    String userName, // 投稿ユーザー名
    String shoutDetail, // 投稿内容(文章)
    @Default([]) List<String> shoutImageList, // 投稿内容(画像)
    @Default([]) List<String> shoutMovieList, // 投稿内容(動画)
    @Default([]) List<String> shoutTagList, // 投稿タグ
    DateTime shoutTimeStamp, // 投稿日時
    @Default(0) int shoutFavorite, // いいね数
    @Default(0) int shoutComments, // コメント数
  }) = ShoutDetailStateData;
}
