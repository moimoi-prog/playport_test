import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/module/CommonModule.dart';

// ------------------------------
// 処理概要　　: トークを登録
// 対象テーブル: rooms.users
// ------------------------------
Future<String> registerTalk(String createUid, String memberUid) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    Map<String, dynamic> roomMap = {
      // トークデータ
      Strings.TYPE: Strings.TALK,
      Strings.CREATE: now,
      Strings.UPDATE: now
    };

    DocumentReference ref = await FirebaseFirestore.instance // トークを登録
        .collection(Strings.TALKS)
        .add(roomMap);

    await FirebaseFirestore.instance // ルームにメンバーを登録
        .collection(Strings.TALKS)
        .doc(ref.id)
        .collection(Strings.MEMBERS)
        .doc(createUid)
        .set(<String, dynamic>{Strings.UID: createUid});

    await FirebaseFirestore.instance // ルームにメンバーを登録
        .collection(Strings.TALKS)
        .doc(ref.id)
        .collection(Strings.MEMBERS)
        .doc(memberUid)
        .set(<String, dynamic>{Strings.UID: memberUid});

    Map<String, dynamic> talkMap = { // ユーザーに登録するルームデータ
      Strings.ID: ref.id,
      Strings.OPPONENT: memberUid,
      Strings.CREATE: now,
      Strings.UPDATE: now,
      Strings.READ: now,
      Strings.TYPE:
      Strings.TALK
    };

    await FirebaseFirestore.instance // ユーザーデータにルームを登録
        .collection(Strings.USERS)
        .doc(createUid)
        .collection(Strings.TALKS)
        .doc(ref.id)
        .set(talkMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");

    return ref.id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

Future registerUserTalk(String roomId, String opponent) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    Map<String, dynamic> talkMap = { // ユーザーに登録するルームデータ
      Strings.ID: roomId,
      Strings.OPPONENT: opponent,
      Strings.CREATE: now,
      Strings.UPDATE: now,
      Strings.READ: now,
      Strings.TYPE:
      Strings.TALK
    };

    await FirebaseFirestore.instance
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.TALKS)
        .doc(roomId)
        .set(talkMap);

  } catch (e) {

  }
}

// ------------------------------
// 処理概要　　: トークを削除する
// 対象テーブル: users, rooms
// ------------------------------
Future<void> deleteTalk(String id) async {
  try {
    FirebaseFirestore.instance // userのトークデータを削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.TALKS)
        .doc(id)
        .delete();

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
// 対象テーブル: rooms
// ------------------------------
Future<void> readTalk(String roomId, DateTime now) async {
  try {
    await FirebaseFirestore.instance // 既読をつける
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(<String, dynamic>{Strings.READ: now});
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
Future<String> sendTalkMessage(String roomId, String uid, String opponent, String content, String type) async {
  try {
    DateTime now = DateTime.now();

    QuerySnapshot query = await FirebaseFirestore.instance // 相手側にルームが登録されているかを判定する
        .collection(Strings.USERS)
        .doc(opponent)
        .collection(Strings.TALKS)
        .where(Strings.OPPONENT, isEqualTo: user.uid)
        .get();

    if (query.size == 0) {
      Map<String, dynamic> talkMap = {
        // ルームデータを生成
        Strings.ID: roomId,
        Strings.OPPONENT: user.uid,
        Strings.CREATE: now,
        Strings.UPDATE: now,
        Strings.READ: now,
        Strings.TYPE: Strings.TALK
      };

      await FirebaseFirestore.instance // 作成済みである場合、既存のルームIDを格納
          .collection(Strings.USERS)
          .doc(opponent)
          .collection(Strings.TALKS)
          .doc(roomId)
          .set(talkMap);
    }

    Map<String, dynamic> messageMap = {
      // 送信するメッセージデータを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: now
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.TALKS)
        .doc(roomId)
        .collection(Strings.MESSAGES)
        .add(messageMap);

    Map<String, dynamic> roomMap = {
      // トークデータ
      Strings.UPDATE: now
    };

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(roomMap);

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(roomMap);

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.USERS)
        .doc(opponent)
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(roomMap);

    return roomId;
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
Future<String> sendTalkImage(String roomId, String uid, String opponent, String content, String type, int width, int height) async {
  try {
    DateTime now = DateTime.now();

    QuerySnapshot query = await FirebaseFirestore.instance // 相手側にルームが登録されているか判定する
        .collection(Strings.USERS)
        .doc(opponent)
        .collection(Strings.TALKS)
        .where(Strings.OPPONENT, isEqualTo: user.uid)
        .get();

    if (query.size == 0) {
      Map<String, dynamic> talkMap = {
        // ルームデータを生成
        Strings.ID: roomId,
        Strings.OPPONENT: user.uid,
        Strings.CREATE: now,
        Strings.UPDATE: now,
        Strings.READ: now
      };

      // 作成済みである場合、既存のルームIDを格納
      await FirebaseFirestore.instance.collection(Strings.USERS).doc(opponent).collection(Strings.TALKS).doc(roomId).set(talkMap);
    }

    Map<String, dynamic> imageMap = { // 送信する画像データを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: DateTime.now(),
      Strings.WIDTH: width,
      Strings.HEIGHT: height
    };

    // メッセージを送信
    await FirebaseFirestore.instance
        .collection(Strings.TALKS)
        .doc(roomId)
        .collection(Strings.MESSAGES)
        .add(imageMap);

    Map<String, dynamic> roomMap = {
      // トークデータ
      Strings.UPDATE: now
    };

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(roomMap);

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(roomMap);

    await FirebaseFirestore.instance // トークを更新
        .collection(Strings.USERS)
        .doc(opponent)
        .collection(Strings.TALKS)
        .doc(roomId)
        .update(roomMap);


    // メッセージを表示
    Fluttertoast.showToast(msg: "送信しました。");

    return roomId;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}
