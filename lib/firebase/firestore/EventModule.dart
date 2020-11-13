import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/ApplicationStatus.dart';
import 'package:playport_test/data/Battle.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------
// メソッド名　: registerEvent
// 処理概要　　: イベントを登録
// 対象テーブル: event
// ------------------------------
Future<DocumentReference> registerEvent(Map<String, dynamic> map) async {
  try {

    DateTime now = DateTime.now(); // タイムスタンプを生成

    DocumentReference ref = await FirebaseFirestore.instance // イベントを登録
        .collection(Strings.EVENTS)
        .add(map);

    Map<String, dynamic> roomMap = { // イベントの全体チャットデータを生成
      Strings.ID: ref.id,
      Strings.NAME: "グループ",
      Strings.TYPE: Strings.GROUP,
      Strings.CREATE: now
    };

    Map<String, dynamic> userHeldEventMap = { // ユーザーに登録する申請情報を生成
      Strings.ID: ref.id,
      Strings.TYPE: Strings.HELD_EVENTS,
      Strings.TIMESTAMP: now
    };

    await FirebaseFirestore.instance// ルームを登録
        .collection(Strings.ROOMS)
        .doc(ref.id)
        .set(roomMap);

    await FirebaseFirestore.instance // ユーザーに開催イベントを登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.HELD_EVENTS)
        .doc(ref.id)
        .set(userHeldEventMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");

    // リターン
    return ref;

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// メソッド名　: updateEvent
// 処理概要　　: イベントを変更
// 対象テーブル: event
// ------------------------------
Future<String> updateEvent(String id, Map<String, dynamic> map) async {
  try {
    await FirebaseFirestore.instance // イベント内容を更新
        .collection(Strings.EVENTS)
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
// 処理概要　　: イベントを削除
// 対象テーブル: event, users
// ------------------------------
Future<void> deleteEvent(String id) async {
  try {

    List<DocumentSnapshot> docs = ( // イベントへの申請情報を取得
        await FirebaseFirestore.instance
            .collection(Strings.EVENTS)
            .doc(id)
            .collection(Strings.REQUESTS)
            .get()
    ).docs;

    // 申請情報を削除
    for (DocumentSnapshot doc in docs) {
      await FirebaseFirestore.instance // ユーザーの申請情報を削除
          .collection(Strings.USERS)
          .doc(doc.data()[Strings.UID])
          .collection(Strings.JOIN_EVENTS)
          .doc(id)
          .delete();

      await FirebaseFirestore.instance // イベントの申請情報を取得
          .collection(Strings.EVENTS)
          .doc(id)
          .collection(Strings.REQUESTS)
          .doc(doc.data()[Strings.UID])
          .delete();
    }

    FirebaseFirestore.instance // ユーザーに登録しているイベント情報を削除
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.HELD_EVENTS)
        .doc(id)
        .delete();

    FirebaseFirestore.instance // イベント情報を削除
        .collection(Strings.EVENTS)
        .doc(id)
        .delete();

    // メッセージを表示
    Fluttertoast.showToast(msg: "大会を中止しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// ------------------------------
// 処理概要　　: イベント参加申請を送信する
// 対象テーブル: event, users
// id ... イベントID
// ------------------------------
Future<void> sendEventRequest(String id) async {
  try {
    // タイムスタンプを生成
    DateTime now = DateTime.now();

    Map<String, dynamic> eventRequestMap = { // イベントに登録する申請情報を生成
      Strings.UID: user.uid,
      Strings.STATUS: ApplicationStatus.REQUEST,
      Strings.TIMESTAMP: now
    };

    Map<String, dynamic> userRequestMap = { // ユーザーに登録する申請情報を生成
      Strings.ID: id,
      Strings.STATUS: ApplicationStatus.REQUEST,
      Strings.TYPE: Strings.JOIN_EVENTS,
      Strings.TIMESTAMP: now
    };

    await FirebaseFirestore.instance // イベントに申請情報を登録
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.REQUESTS)
        .doc(user.uid)
        .set(eventRequestMap);

    await FirebaseFirestore.instance // ユーザーに申請情報を登録
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.JOIN_EVENTS)
        .doc(id)
        .set(userRequestMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// ------------------------------
// 処理概要　　: イベント参加申請を承認する
// 対象テーブル: event, users
// id ... イベントID
// uid ... ユーザーID
// inquiryId ... 問い合わせID
// ------------------------------
Future<void> approvalEventRequest(String id, String uid, String inquiryId) async {
  try {

    Map<String, dynamic> eventRequestMap = { // イベントに登録する申請情報を生成
      Strings.STATUS: ApplicationStatus.APPROVAL,
      Strings.INQUIRY: inquiryId
    };

    Map<String, dynamic> userRequestMap = { // ユーザーに登録する申請情報を生成
      Strings.STATUS: ApplicationStatus.APPROVAL,
      Strings.INQUIRY: inquiryId
    };

    await FirebaseFirestore.instance // イベントに申請情報を登録
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.REQUESTS)
        .doc(uid)
        .update(eventRequestMap);

    await FirebaseFirestore.instance // ユーザーに申請情報を登録
        .collection(Strings.USERS)
        .doc(uid)
        .collection(Strings.JOIN_EVENTS)
        .doc(id)
        .update(userRequestMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// ------------------------------
// 処理概要　　: イベント参加申請を拒否する
// 対象テーブル: event, users
// id ... イベントID
// uid ... ユーザーID
// ------------------------------
Future<void> rejectEventRequest(String id, String uid) async {
  try {

    Map<String, dynamic> eventRequestMap = { // イベントに登録する申請情報を生成
      Strings.STATUS: ApplicationStatus.REJECT,
    };

    Map<String, dynamic> userRequestMap = { // ユーザーに登録する申請情報を生成
      Strings.STATUS: ApplicationStatus.REJECT,
    };

    await FirebaseFirestore.instance // イベントに申請情報を登録
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.REQUESTS)
        .doc(uid)
        .update(eventRequestMap);

    await FirebaseFirestore.instance // ユーザーに申請情報を登録
        .collection(Strings.USERS)
        .doc(uid)
        .collection(Strings.JOIN_EVENTS)
        .doc(id)
        .update(userRequestMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");

  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}


// ------------------------------
// 処理概要　　: 大会参加申請を取消
// 対象テーブル: event, users
// ------------------------------
Future<void> cancelEventRequest(String id) async {
  try {

    await FirebaseFirestore.instance // ユーザーの申請情報を削除する
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.JOIN_EVENTS)
        .doc(id)
        .delete();

    await FirebaseFirestore.instance // イベントの申請情報を削除する
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.REQUESTS)
        .doc(user.uid)
        .delete();

    // メッセージを表示
    Fluttertoast.showToast(msg: "成功しました。");
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");
  }
}

// // ------------------------------
// // 処理概要　　: 既読をつける
// // 対象テーブル: rooms
// // ------------------------------
// Future<void> readTalk(String roomId) async {
//   try {
//     // タイムスタンプを生成
//     DateTime now = DateTime.now();
//
//     await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection("talks").doc(roomId).update(<String, dynamic>{"read": now});
//
//
//   } catch (e) {
//     // メッセージを表示
//     Fluttertoast.showToast(msg: "失敗しました。");
//
//     return null;
//   }
// }

// ------------------------------
// 処理概要　　: メッセージを送信する(全体チャット)
// 対象テーブル: rooms
// ------------------------------
Future<String> sendWholeMessage(String id, String uid, String content, String type) async {
  try {
    Map<String, dynamic> messageMap = {
      // 送信するメッセージデータを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: DateTime.now()
    };

    await FirebaseFirestore.instance // メッセージを送信
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.MESSAGES)
        .doc()
        .set(messageMap);

    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: 画像を送信する(全体チャット)
// 対象テーブル: rooms
// ------------------------------
Future<String> sendWholeImage(String id, String uid, String content, String type, int width, int height) async {
  try {
    Map<String, dynamic> imageMap = {
      // 送信する画像データを生成
      Strings.UID: uid,
      Strings.CONTENT: content,
      Strings.TYPE: type,
      Strings.TIMESTAMP: DateTime.now(),
      Strings.WIDTH: width,
      Strings.HEIGHT: height
    };

    await FirebaseFirestore.instance // 画像を送信
        .collection(Strings.EVENTS)
        .doc(id)
        .collection(Strings.MESSAGES)
        .doc()
        .set(imageMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "送信しました。");

    return id;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}

// ------------------------------
// 処理概要　　: BattleDocをBattleデータに変換する
// 対象テーブル: rooms
// ------------------------------
Battle compareDocToBattle(DocumentSnapshot d) {
  // Battleデータを生成
  Battle battle = Battle(
      uid: d.data()[Strings.ORGANIZER],
      id: d.id,
      title: d.data()[Strings.TITLE],
      prize: d.data()[Strings.PRIZE],
      rule: d.data()[Strings.RULE],
      game: d.data()[Strings.GAME],
      official: d.data()[Strings.OFFICIAL],
      type: d.data()[Strings.TYPE],
      remarks: d.data()[Strings.REMARKS],
      timestamp: d.data()[Strings.TIMESTAMP].toDate(),
      held: d.data()[Strings.HELD].toDate(),
      deadLine: d.data()[Strings.DEADLINE].toDate()
  );


}
