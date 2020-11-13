import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------
// 処理概要　　: 投稿する
// 対象テーブル: post, users
// ------------------------------
Future<void> createNewPost(String detail, {String postId}) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.UID: user.uid, 
      Strings.POSTID: postId, 
      Strings.TITLE: "ダミー", 
      Strings.DETAIL: detail, 
      Strings.FAVORITE: 0, 
      Strings.TIMESTAMP: now
    };

    if (postId == null) {
      DocumentReference result = await FirebaseFirestore.instance // 新規登録
          .collection(Strings.SHOUTS)
          .add(map);
      
    } else {
      await FirebaseFirestore.instance // 更新
          .collection(Strings.SHOUTS)
          .doc(postId)
          .set(map);
    }

    // シャウトを登録
    await FirebaseFirestore.instance // シャウトを登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.SHOUTS)
        .doc(postId)
        .set(<String, dynamic>{Strings.ID: postId});

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}