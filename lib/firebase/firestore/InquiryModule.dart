import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------
// 処理概要　　: 問い合わせを登録
// 対象テーブル: inquires, users
// id ... イベントID
// uid ... ユーザーID
// ------------------------------
Future<String> registerInquiry(String id, String uid) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    // ----------------------
    // inquiriesにデータを登録
    // ----------------------
    Map<String, dynamic> inquiryMap = { // 問い合わせテーブルに登録するデータを生成
      Strings.NAME: "問い合わせ",
      Strings.EVENT: id,
      Strings.UID: uid,
      Strings.CREATE: now
    };

    DocumentReference ref = await FirebaseFirestore.instance // 問い合わせテーブルに登録
        .collection(Strings.INQUIRIES)
        .add(inquiryMap);

    // ----------------------
    // userのinquiriesにデータを登録
    // ----------------------
    Map<String, dynamic> userInquiryMap = { // userの問い合わせテーブルに登録するデータを生成
      Strings.EVENT: id,
      Strings.INQUIRY: ref.id,
      Strings.CREATE: now,
      Strings.READ: now,
      Strings.TYPE: Strings.INQUIRY
    };

    await FirebaseFirestore.instance // userの問い合わせテーブルにデータを登録
        .collection(Strings.USERS)
        .doc(uid)
        .collection(Strings.INQUIRIES)
        .doc(id)
        .set(userInquiryMap);

    // ----------------------
    // eventのinquiriesにデータを登録
    // ----------------------
    Map<String, dynamic> eventInquiryMap = { // eventの問い合わせテーブルに登録するデータを生成
      Strings.UID: uid,
      Strings.INQUIRY: ref.id,
      Strings.CREATE: now,
      Strings.READ: now
    };

    await FirebaseFirestore.instance // eventの問い合わせテーブルにデータを登録
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.INQUIRIES)
        .doc(uid)
        .set(eventInquiryMap);

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
// 処理概要　　: 問い合わせを削除する
// 対象テーブル: users, rooms
// id ... イベントID
// ------------------------------
Future<void> deleteInquiry(String id) async {
  try {
    FirebaseFirestore.instance // userの問い合わせ情報を削除する
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.INQUIRIES)
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
// 処理概要　　: userが既読をつける
// 対象テーブル: rooms
// id ... イベントID
// ------------------------------
Future<void> readUserInquiry(String id) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    await FirebaseFirestore.instance // 既読をつける
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.INQUIRIES)
        .doc(id)
        .update(<String, dynamic>{Strings.READ: now});


  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: 開催者が既読をつける
// 対象テーブル: rooms
// eventId ... イベント
// uid ... ユーザー
// ------------------------------
Future<void> readEventInquiry(String eventId, String uid) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    await FirebaseFirestore.instance // 既読をつける
        .collection(Strings.EVENTS)
        .doc(eventId)
        .collection(Strings.INQUIRIES)
        .doc(uid)
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
Future<String> sendInquiryMessage(String id, String uid, String content, String type) async {
  try {
    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: DateTime.now()
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.INQUIRIES)
        .doc(id)
        .collection(Strings.MESSAGES)
        .doc()
        .set(map);

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
Future<String> sendInquiryImage(String id, String uid, String content, String type, int width, int height) async {
  try {
    Map<String, dynamic> map = { // 登録するデータを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: DateTime.now(),
      Strings.WIDTH: width,
      Strings.HEIGHT: height
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.INQUIRIES)
        .doc(id)
        .collection(Strings.MESSAGES)
        .doc()
        .set(map);

    // メッセージを表示
    Fluttertoast.showToast(msg: "送信しました。");

    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}