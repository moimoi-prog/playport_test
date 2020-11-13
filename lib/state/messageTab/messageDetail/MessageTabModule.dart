import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/module/MessageModule.dart';

import '../data/MessageDetail.dart';


// -----------------------------------
// 処理名称: createTalkMessageData
// 処理概要: talkデータをメッセージデータに変換する
// -----------------------------------
Future<void> createTalkMessageData(
    List<DocumentSnapshot> messageDocs, // talkデータリスト
    List<MessageDetail> messages // Messageデータリスト
    ) async {
  // フレンドメッセージオブジェクトリストを生成
  for (DocumentSnapshot messageDoc in messageDocs) {
    String image; // 画像
    String name; // 名前
    String uid; // uid
    String id; // id
    String type; // タイプ
    String message; // メッセージ
    Timestamp create; // 作成日
    Timestamp read; // 確認日
    Timestamp update; // 確認日
    int sum; // メッセージ数

    // 相手のユーザー情報を取得
    DocumentSnapshot userDoc = await FirebaseFirestore.instance // 相手のユーザー情報を取得
        .collection(Strings.USERS)
        .doc(messageDoc.data()[Strings.OPPONENT])
        .get();

    QuerySnapshot messageQuery = await FirebaseFirestore.instance // メッセージ一覧を取得
        .collection(Strings.TALKS)
        .doc(messageDoc.id)
        .collection(Strings.MESSAGES)
        .where(Strings.TIMESTAMP, isGreaterThanOrEqualTo: messageDoc.data()[Strings.CREATE])
        .get();

    image = userDoc.data()[Strings.PROFILE_IMAGE_PATH];
    name = userDoc.data()[Strings.NAME];
    uid = userDoc.id;
    id = messageDoc.id;
    type = messageDoc.data()[Strings.TYPE];
    message = getMessage(messageQuery.docs);
    create = messageDoc.data()[Strings.CREATE];
    read = messageDoc.data()[Strings.READ];
    update = messageDoc.data()[Strings.UPDATE];
    sum = messageQuery.size;

    MessageDetail detail = MessageDetail();

    detail.image = image;
    detail.uid = uid;
    detail.name = name;
    detail.id = id;
    detail.type = type;
    detail.message = message;
    detail.create = create;
    detail.read = read;
    detail.update = update;
    detail.sum = sum;

    messages.add(detail);
  }
}

// -----------------------------------
// 処理名称: createGroupMessageData
// 処理概要: groupデータをメッセージデータに変換する
// -----------------------------------
Future<void> createGroupMessageData(
    List<DocumentSnapshot> messageDocs, // talkデータリスト
    List<MessageDetail> messages // Messageデータリスト
    ) async {
  // グループメッセージオブジェクトリストを生成
  for (DocumentSnapshot messageDoc in messageDocs) {
    String image; // 画像
    String name; // 名前
    // String uid; // uid
    String id; // id
    String type; // タイプ
    String message; // メッセージ
    Timestamp create; // 作成日
    Timestamp read; // 確認日
    Timestamp update; // 確認日
    int sum; // メッセージ数

    DocumentSnapshot groupDoc = await FirebaseFirestore.instance // メッセージ一覧を取得
        .collection(Strings.GROUPS)
        .doc(messageDoc.id)
        .get();

    QuerySnapshot messageQuery = await FirebaseFirestore.instance // メッセージ一覧を取得
        .collection(Strings.GROUPS)
        .doc(messageDoc.id)
        .collection(Strings.MESSAGES)
        .where(Strings.TIMESTAMP, isGreaterThanOrEqualTo: messageDoc.data()[Strings.CREATE])
        .get();

    image = messageDoc.data()[Strings.IMAGE];
    name = messageDoc.data()[Strings.NAME];
    id = messageDoc.id;
    type = messageDoc.data()[Strings.TYPE];
    message = getMessage(messageQuery.docs);
    create = groupDoc.data()[Strings.CREATE];
    read = messageDoc.data()[Strings.READ];
    update = groupDoc.data()[Strings.UPDATE];
    sum = messageQuery.size;

    MessageDetail detail = MessageDetail();

    detail.image = image;
    detail.name = name;
    detail.id = id;
    detail.type = type;
    detail.message = message;
    detail.create = create;
    detail.read = read;
    detail.update = update;
    detail.sum = sum;

    messages.add(detail);
  }
}

// -----------------------------------
// 処理名称: createHeldEventMessageData
// 処理概要: HeldEventデータをメッセージデータに変換する
// -----------------------------------
Future<void> createHeldEventMessageData(
    List<DocumentSnapshot> messageDocs, // talkデータリスト
    List<MessageDetail> messages // Messageデータリスト
    ) async {
  // 主催イベントメッセージオブジェクトリストを生成
  for (DocumentSnapshot messageDoc in messageDocs) {
    String image; // 画像
    String name; // 名前
    String uid; // uid
    String id; // id
    String type; // タイプ
    String message; // メッセージ
    Timestamp create; // 作成日
    Timestamp read; // 確認日
    Timestamp update; // 確認日
    int sum; // メッセージ

    DocumentSnapshot eventDoc = await FirebaseFirestore.instance // イベントデータを取得
        .collection(Strings.EVENTS)
        .doc(messageDoc.id)
        .get();

    DocumentSnapshot userDoc = await FirebaseFirestore.instance // イベント主催者データを取得
        .collection(Strings.USERS)
        .doc(eventDoc.data()[Strings.ORGANIZER])
        .get();

    QuerySnapshot messageQuery = await FirebaseFirestore.instance // メッセージ一覧を取得
        .collection(Strings.EVENTS)
        .doc(messageDoc.id)
        .collection(Strings.MESSAGES)
        .get();

    image = userDoc.data()[Strings.PROFILE_IMAGE_PATH];
    name = eventDoc.data()[Strings.TITLE];
    uid = userDoc.id;
    id = eventDoc.id;
    type = messageDoc.data()[Strings.TYPE];
    message = getMessage(messageQuery.docs);
    create = messageDoc.data()[Strings.CREATE];
    read = messageDoc.data()[Strings.READ];
    update = messageDoc.data()[Strings.UPDATE];
    sum = messageQuery.size;

    MessageDetail detail = MessageDetail();

    detail.image = image;
    detail.name = name;
    detail.uid = uid;
    detail.id = id;
    detail.type = type;
    detail.message = message;
    detail.create = create;
    detail.read = read;
    detail.update = update;
    detail.sum = sum;

    messages.add(detail);
  }
}

// -----------------------------------
// 処理名称: createJoinEventMessageData
// 処理概要: JoinEventデータをメッセージデータに変換する
// -----------------------------------
Future<void> createJoinEventMessageData(
    List<DocumentSnapshot> messageDocs, // talkデータリスト
    List<MessageDetail> messages // Messageデータリスト
    ) async {
  // 参加イベントメッセージオブジェクトリストを生成
  for (DocumentSnapshot messageDoc in messageDocs) {
    String image; // 画像
    String name; // 名前
    String uid; // uid
    String id; // id
    String type; // タイプ
    String message; // メッセージ
    Timestamp create; // 作成日
    Timestamp read; // 確認日
    Timestamp update; // 確認日
    int sum; // メッセージ

    DocumentSnapshot eventDoc = await FirebaseFirestore.instance // イベントデータを取得
        .collection(Strings.EVENTS)
        .doc(messageDoc.id)
        .get();

    DocumentSnapshot userDoc = await FirebaseFirestore.instance // イベント主催者データを取得
        .collection(Strings.USERS)
        .doc(eventDoc.data()[Strings.ORGANIZER])
        .get();

    QuerySnapshot messageQuery = await FirebaseFirestore.instance // メッセージ一覧を取得
        .collection(Strings.EVENTS)
        .doc(messageDoc.id)
        .collection(Strings.MESSAGES)
        .get();

    image = userDoc.data()[Strings.PROFILE_IMAGE_PATH];
    name = eventDoc.data()[Strings.TITLE];
    uid = userDoc.id;
    id = eventDoc.id;
    type = messageDoc.data()[Strings.TYPE];
    message = getMessage(messageQuery.docs);
    create = messageDoc.data()[Strings.CREATE];
    read = messageDoc.data()[Strings.READ];
    update = messageDoc.data()[Strings.UPDATE];
    sum = messageQuery.size;

    MessageDetail detail = MessageDetail();

    detail.image = image;
    detail.name = name;
    detail.uid = uid;
    detail.id = id;
    detail.type = type;
    detail.message = message;
    detail.create = create;
    detail.read = read;
    detail.update = update;
    detail.sum = sum;

    messages.add(detail);
  }
}