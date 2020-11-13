import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

import '../StorageModule.dart';

// ------------------------------
// 処理概要　　: グループを登録
// 対象テーブル: groups.users
// ------------------------------
Future<String> registerGroup(
    String imagePath, // イメージ画像
    String groupName, // グループ名
    List<String> selectedFriends // メンバーuid
    ) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    File image = File(imagePath);

    // 画像をStorageに保存
    String path = await uploadImage(image);

    // ---------------------
    // グループを登録
    // ---------------------
    Map<String, dynamic> groupMap = { // 登録するグループデータ
      Strings.NAME: groupName,
      Strings.TYPE: Strings.GROUP,
      Strings.IMAGE: path,
      Strings.CREATE: now,
      Strings.UPDATE: now,
    };

    DocumentReference ref = await FirebaseFirestore.instance // グループを登録
        .collection(Strings.GROUPS)
        .add(groupMap);


    // ---------------------
    // 自分をグループメンバーに登録
    // ---------------------
    Map<String, dynamic> myMap = { // グループに登録するデータを生成
      Strings.UID: user.uid,
      Strings.CREATE: now
    };

    Map<String, dynamic> myGroupsMap = { // ユーザーに登録するデータを生成
      Strings.ID: ref.id,
      Strings.NAME: groupName,
      Strings.IMAGE: path,
      Strings.CREATE: now,
      Strings.UPDATE: now,
      Strings.READ: now,
      Strings.TYPE: Strings.GROUP,
    };

    await FirebaseFirestore.instance // グループにメンバーを登録
        .collection(Strings.GROUPS)
        .doc(ref.id)
        .collection(Strings.MEMBERS)
        .doc(user.uid)
        .set(myMap);

    await FirebaseFirestore.instance // ユーザーにグループを登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.GROUPS)
        .doc(ref.id)
        .set(myGroupsMap);

    // ---------------------
    // 選択したメンバーをグループに登録
    // ---------------------
    for (String uid in selectedFriends) {
      Map<String, dynamic> memberMap = { // グループに登録するデータを生成
        Strings.UID: uid,
        Strings.CREATE: now
      };

      Map<String, dynamic> userGroupsMap = { // ユーザーに登録するデータを生成
        Strings.ID: ref.id,
        Strings.NAME: groupName,
        Strings.IMAGE: path,
        Strings.CREATE: now,
        Strings.UPDATE: now,
        Strings.READ: now,
        Strings.TYPE: Strings.GROUP,
      };

      await FirebaseFirestore.instance // グループにメンバーを登録
          .collection(Strings.GROUPS)
          .doc(ref.id)
          .collection(Strings.MEMBERS)
          .doc(uid)
          .set(memberMap);

      await FirebaseFirestore.instance // ユーザーにグループを登録
          .collection(Strings.USERS)
          .doc(uid)
          .collection(Strings.GROUPS)
          .doc(ref.id)
          .set(userGroupsMap);
    }
    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");

    return ref.id;

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: グループを削除する
// 対象テーブル: users, groups
// ------------------------------
Future<void> deleteGroup(String id) async {
  try {
    // userのグループデータを削除
    FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.GROUPS).doc(id).delete();

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: 既読をつける
// 対象テーブル: groups
// ------------------------------
Future<void> readGroup(String groupId) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    Map<String, dynamic> map = { // 登録用データを生成
      Strings.READ: now
    };

    await FirebaseFirestore.instance
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.GROUPS)
        .doc(groupId)
        .update(map);


  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: メッセージを送信する
// 対象テーブル: rooms
// ------------------------------
Future<String> sendGroupMessage(String id, String uid, String content, String type) async {
  try {
    DateTime now = DateTime.now();

    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: now
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.GROUPS)
        .doc(id)
        .collection(Strings.MESSAGES)
        .doc()
        .set(map);

    Map<String, dynamic> groupMap = { // 登録するデータを生成
      Strings.UPDATE: now
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.GROUPS)
        .doc(id)
        .update(groupMap);

    Map<String, dynamic> roomMap = {
      // トークデータ
      Strings.UPDATE: now
    };

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.USERS)
        .doc(uid)
        .collection(Strings.TALKS)
        .doc(id)
        .update(roomMap);


    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: 画像を送信する
// 対象テーブル: rooms
// ------------------------------
Future<String> sendGroupImage(String id, String uid, String content, String type, int width, int height) async {
  try {
    DateTime now = DateTime.now();

    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: now,
      Strings.WIDTH: width,
      Strings.HEIGHT: height
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.GROUPS)
        .doc(id)
        .collection(Strings.MESSAGES)
        .doc()
        .set(map);

    Map<String, dynamic> groupMap = { // 登録するデータを生成
      Strings.UPDATE: now
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.GROUPS)
        .doc(id)
        .update(groupMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "送信しました。");

    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}