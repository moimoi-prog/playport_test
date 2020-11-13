import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';

// ------------------------------
// 処理概要　　: オートマッチング用ルームを登録
// 対象テーブル: autos
// ------------------------------
Future<String> registerAutos(
    String game,  // ゲーム名
    String purpose // 目的
    ) async {
  try {
    /* ルームID */ String id;

    QuerySnapshot results = await FirebaseFirestore.instance // 入室待ちのルームを取得
        .collection(Strings.AUTOS)
        .where(Strings.GAME, isEqualTo: game)
        .where(Strings.PURPOSE, isEqualTo: purpose)
        .where(Strings.COMPLETE, isEqualTo: false)
        .get();

    if (results.size > 0) {
      // 存在している場合の処理
      // ルームIDを取得
      id = results.docs[0].id;

      await FirebaseFirestore.instance // ルームメンバーを登録
          .collection(Strings.AUTOS)
          .doc(id)
          .collection(Strings.MEMBERS)
          .doc(user.uid)
          .set(<String, dynamic>{Strings.UID: user.uid});

      await FirebaseFirestore.instance // ルームの状態を更新
          .collection(Strings.AUTOS)
          .doc(id)
          .update(<String, dynamic>{Strings.COMPLETE: true});
    } else {
      Map<String, dynamic> roomsMap = {
        // 登録するデータを生成
        Strings.GAME: game,
        Strings.PURPOSE: purpose,
        Strings.COMPLETE: false
      };

      id = (await FirebaseFirestore.instance // 登録
              .collection(Strings.AUTOS)
              .add(roomsMap))
          .id;

      // ルームメンバーを登録
      await FirebaseFirestore.instance // ルームメンバーを登録
          .collection(Strings.AUTOS)
          .doc(id)
          .collection(Strings.MEMBERS)
          .doc(user.uid)
          .set(<String, dynamic>{Strings.UID: user.uid});
    }

    return id;
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
Future<String> sendAutoMessage(String roomId, String uid, String opponent, String content, String type) async {
  try {
    Map<String, dynamic> messageMap = {
      // 送信するメッセージデータを生成
      Strings.UID: uid, 
      Strings.CONTENT: content, 
      Strings.TYPE: type, 
      Strings.TIMESTAMP: DateTime.now()
    };

    // メッセージを送信
    await FirebaseFirestore.instance
        .collection(Strings.AUTOS)
        .doc(roomId)
        .collection(Strings.MESSAGES)
        .doc()
        .set(messageMap);

    // ルームIDを返却する
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
Future<String> sendAutoImage(String roomId, String uid, String opponent, String content, String type, int width, int height) async {
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
    
    // メッセージを送信
    await FirebaseFirestore.instance
        .collection(Strings.AUTOS)
        .doc(roomId)
        .collection(Strings.MESSAGES)
        .doc()
        .set(imageMap);

    // メッセージを表示
    Fluttertoast.showToast(msg: "送信しました。");

    return roomId;
  } catch (e) {
    // メッセージを表示
    Fluttertoast.showToast(msg: "失敗しました。");

    return null;
  }
}
