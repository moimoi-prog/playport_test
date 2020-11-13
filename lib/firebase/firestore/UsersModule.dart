import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/module/CommonModule.dart';

// ------------------------------
// 処理概要　　: ユーザーを登録する
// 対象テーブル: users
// ------------------------------
Future<void> registerUser(String name, String uid, String email) async {
  try {
    // 登録データを生成
    Map<String, dynamic> map = {
      Strings.UID: uid,
      Strings.NAME: name,
      Strings.EMAIL: email,
      Strings.INTRODUCTION: "",
      Strings.PROFILE_IMAGE_PATH: "",
      Strings.BACKGROUND_IMAGE_PATH: "",
    };

    await FirebaseFirestore.instance // ユーザーを登録
        .collection(Strings.USERS)
        .doc(uid)
        .set(map);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// ------------------------------
// 処理概要　　: ユーザー情報を取得する
// 対象テーブル: users
// ------------------------------
Future<DocumentSnapshot> getUser(String uid) async {
  try {
    DocumentSnapshot query = await FirebaseFirestore.instance // ユーザーを取得
        .collection(Strings.USERS)
        .doc(uid)
        .get();

    // ユーザーが存在しない場合、nullを返す
    if (!query.exists) {
      // メッセージを表示
      Fluttertoast.showToast(msg: "ユーザー情報が存在しません");

      return null;
    }

    // ユーザーを返す
    return query;

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: ログインする
// 対象テーブル: users
// ------------------------------
Future userLogin() async {
  try {
    DateTime now = DateTime.now();

    // 変更後のマップを生成
    Map<String, dynamic> map = {
      Strings.LOGIN_TIME: now,
      Strings.LOGIN_FLAG: true
    };

    await FirebaseFirestore.instance // ログインする
        .collection(Strings.USERS)
        .doc(user.uid)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: ログアウトする
// 対象テーブル: users
// ------------------------------
Future userLogout() async {
  try {
    DateTime now = DateTime.now();

    // 変更後のマップを生成
    Map<String, dynamic> map = {
      Strings.LOGIN_TIME: now,
      Strings.LOGIN_FLAG: false
    };

    await FirebaseFirestore.instance // ログアウトする
        .collection(Strings.USERS)
        .doc(user.uid)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: フレンドリクエストを送信する
// 対象テーブル: users
// ------------------------------
Future sendFriendRequest(String senderUid, String destinationUid) async {
  try {
    Map<String, dynamic> map = { // フレンドリクエストデータを生成
      Strings.UID: senderUid,
    };

    await FirebaseFirestore.instance // リクエストを送信する
        .collection(Strings.USERS)
        .doc(destinationUid)
        .collection(Strings.REQUESTS)
        .doc(senderUid)
        .set(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: フレンドリクエストを承認する
// 対象テーブル: users
// ------------------------------
Future approvalFriendRequest(DocumentSnapshot document) async {
  try {
    Map<String, dynamic> map1 = { // 申請した側に登録する情報
      Strings.UID: user.uid,
      Strings.NAME: user.displayName
    };

    Map<String, dynamic> map2 = { // 申請された側に登録する情報
      Strings.UID: document.data()[Strings.UID],
      Strings.NAME: document.data()[Strings.NAME]
    };

    await FirebaseFirestore.instance // 申請した側にデータを登録する
        .collection(Strings.USERS)
        .doc(document.data()[Strings.UID])
        .collection(Strings.FRIENDS)
        .doc(user.uid)
        .set(map1);

    // 申請された側の情報を更新
    await FirebaseFirestore.instance // 申請された側にデータを登録する
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FRIENDS)
        .doc(document.data()[Strings.UID])
        .set(map2);

    await FirebaseFirestore.instance // 申請情報を削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.REQUESTS)
        .doc(document.data()[Strings.UID])
        .delete();

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: フレンドリクエストを拒否する
// 対象テーブル: users
// ------------------------------
Future rejectFriendRequest(DocumentSnapshot document) async {
  try {
    await FirebaseFirestore.instance // 申請された側の情報を削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.REQUESTS)
        .doc(document.data()[Strings.UID])
        .delete();

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: 名前を変更する
// 対象テーブル: users
// ------------------------------
Future setName(String name) async {
  try {
    // 変更後のマップを生成
    Map<String, dynamic> map = {
      Strings.NAME: name,
    };

    await FirebaseFirestore.instance // 名前を変更する
        .collection(Strings.USERS)
        .doc(user.uid)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: 自己紹介を変更する
// 対象テーブル: users
// ------------------------------
Future setIntroduction(String introduction) async {
  try {
    // 変更後のマップを生成
    Map<String, dynamic> map = {
      Strings.INTRODUCTION: introduction,
    };

    await FirebaseFirestore.instance // 自己紹介を変更
        .collection(Strings.USERS)
        .doc(user.uid)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: プロフィール画像を変更する
// 対象テーブル: users
// ------------------------------
Future setProfileImagePath(String path) async {
  try {
    // 変更後のマップを生成
    Map<String, dynamic> map = {
      Strings.PROFILE_IMAGE_PATH: path,
    };

    await FirebaseFirestore.instance // プロフィール画像を変更する
        .collection(Strings.USERS)
        .doc(user.uid)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: 背景画像を変更する
// 対象テーブル: users
// ------------------------------
Future setBackgroungImagePath(String path) async {
  try {
    // 変更後のマップを生成
    Map<String, dynamic> map = {
      Strings.BACKGROUND_IMAGE_PATH: path,
    };

    await FirebaseFirestore.instance // 背景画像を変更
        .collection(Strings.USERS)
        .doc(user.uid)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: ゲームを登録する
// 対象テーブル: users
// ------------------------------
Future setGame(String name, String type, String message) async {
  try {
    // 変更後のマップを生成
    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.NAME: name,
      Strings.TYPE: type,
      Strings.MESSAGE: message
    };

    await FirebaseFirestore.instance // ゲームを登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.GAMES)
        .doc()
        .set(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: ゲームを変更する
// 対象テーブル: users
// ------------------------------
Future updateGame(String id, String name, String type, String message) async {
  try {
    Map<String, dynamic> map = { // 変更後のマップを生成
      Strings.NAME: name,
      Strings.TYPE: type,
      Strings.MESSAGE: message
    };

    await FirebaseFirestore.instance // ゲームを更新
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.GAMES)
        .doc(id)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: ゲームを削除する
// 対象テーブル: users
// ------------------------------
Future rejectGame(String id) async {
  try {
    await FirebaseFirestore.instance // ゲームを削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.GAMES)
        .doc(id)
        .delete();

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: 定型文を登録する
// 対象テーブル: users
// ------------------------------
Future setFixed(String message) async {
  try {
    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.MESSAGE: message
    };

    // 自己紹介を変更
    await FirebaseFirestore.instance // 定型文を登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FIXED)
        .doc()
        .set(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: 定型文を変更する
// 対象テーブル: users
// ------------------------------
Future updateFixed(String id, String message) async {
  try {
    Map<String, dynamic> map = { // 変更後のマップを生成
      Strings.MESSAGE: message
    };

    await FirebaseFirestore.instance // 定型文を変更
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FIXED)
        .doc(id)
        .update(map);

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: 定型文を削除する
// 対象テーブル: users
// ------------------------------
Future rejectFixed(String id) async {
  try {
    await FirebaseFirestore.instance // 定型文を削除する
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.FIXED)
        .doc(id)
        .delete();

    return true;
  } catch (e) {
    // メッセージを表示
    return false;
  }
}

// ------------------------------
// 処理概要　　: トークが登録されているか判定する
// 対象テーブル: users
// ------------------------------
Future<DocumentSnapshot> getTalk(String uid, String opponent) async {
  try {
    QuerySnapshot docs = await FirebaseFirestore.instance // トークを取得する
        .collection(Strings.USERS)
        .doc(uid)
        .collection(Strings.TALKS)
        .where(Strings.OPPONENT, isEqualTo: opponent)
        .get();

    if (docs.size != 1) {
      return null;
    }

    return docs.docs[0];

  } catch (e) {
    // メッセージを表示
    return null;
  }
}

// ------------------------------
// 処理概要　　: フレンド情報を取得する
// 対象テーブル: users
// ------------------------------
Future<List<DocumentSnapshot>> getFriends(String uid) async {
  try {
    QuerySnapshot docs = await FirebaseFirestore.instance // フレンドを取得する
        .collection(Strings.USERS)
        .doc(uid)
        .collection(Strings.FRIENDS)
        .get();

    return docs.docs;

  } catch (e) {
    // メッセージを表示
    return null;
  }
}
