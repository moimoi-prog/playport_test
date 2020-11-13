import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------
// メソッド名　: registerComment
// 処理概要　　: 投稿にコメントする
// 対象テーブル: comment, user, post
// 引数　　　　: reply   ... 投稿
// 　　　　　　: detail  ... 内容
// ------------------------------
Future<DocumentReference> registerComment(String postId, String sentence) async {
  try {
    // 現在の時間を取得
    DateTime now = DateTime.now();

    // commentに登録するデータを生成
    Map<String, dynamic> commentMap = {
      Strings.UID: user.uid, // ユーザーID
      Strings.POSTID: postId, // 投稿
      Strings.SENTENCE: sentence, // 文章
      Strings.TIMESTAMP: now // コメント日時
    };

    DocumentReference comment = await FirebaseFirestore.instance // 登録
        .collection(Strings.COMMENTS)
        .add(commentMap);

    // usersに登録するデータを生成
    Map<String, dynamic> userMap = {
      Strings.POSTID: postId,
      Strings.COMMENT: comment.id,
      Strings.TIMESTAMP: now
    };

    await FirebaseFirestore.instance // 登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.COMMENTS)
        .add(userMap);

    // postsに登録するデータを生成
    Map<String, dynamic> postMap = {
      Strings.UID: user.uid,
      Strings.COMMENT: comment.id,
      Strings.TIMESTAMP: now
    };

    await FirebaseFirestore.instance // 登録
        .collection(Strings.SHOUTS)
        .doc(postId)
        .collection(Strings.COMMENTS)
        .add(postMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");

    // リターン
    return comment;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// メソッド名　: updateComment
// 処理概要　　: コメントを変更
// 対象テーブル: comment
// ------------------------------
Future<String> updateComment(String id, Map<String, dynamic> map) async {
  try {
    await FirebaseFirestore.instance // コメント内容を更新
        .collection(Strings.COMMENT)
        .doc(id)
        .update(map);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");

    // リターン
    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: コメントを削除
// 対象テーブル: comment, users, post
// ------------------------------
Future<void> deleteComment(String postId, String commentId) async {
  try {
    await FirebaseFirestore.instance // commentからデータを削除
        .collection(Strings.COMMENTS)
        .doc(commentId)
        .delete();

    await FirebaseFirestore.instance // usersからデータを削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.COMMENTS)
        .doc(commentId)
        .delete();

    await FirebaseFirestore.instance // postからデータを削除
        .collection(Strings.SHOUTS)
        .doc(postId)
        .collection(Strings.COMMENTS)
        .doc(commentId)
        .delete();

    // メッセージを表示
    Fluttertoast.showToast(msg: "大会を中止しました。");

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

  }
}
