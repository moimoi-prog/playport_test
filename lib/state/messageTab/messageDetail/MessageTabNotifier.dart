import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/enum/MatchingType.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/module/MessageModule.dart';
import 'package:state_notifier/state_notifier.dart';

import '../data/MessageDetail.dart';
import 'MessageTabModule.dart';
import 'MessageTabState.dart';

class MessageTabNotifier extends StateNotifier<MessageTabState> with LocatorMixin {
  MessageTabNotifier() : super(const MessageTabState.loading());

  // 初期化
  @override
  void initState() async {
    super.initState();

    List<MessageDetail> messages = [];

    List<DocumentSnapshot> talkQueries = (await FirebaseFirestore.instance // フレンドメッセージ
            .collection(Strings.USERS)
            .doc(user.uid)
            .collection(Strings.TALKS)
            .get())
        .docs;

    List<DocumentSnapshot> groupQueries = (await FirebaseFirestore.instance // グループメッセージ
            .collection(Strings.USERS)
            .doc(user.uid)
            .collection(Strings.GROUPS)
            .get())
        .docs;

    List<DocumentSnapshot> heldEventQueries = (await FirebaseFirestore.instance // 主催イベントメッセージ
            .collection(Strings.USERS)
            .doc(user.uid)
            .collection(Strings.HELD_EVENTS)
            .get())
        .docs;

    List<DocumentSnapshot> joinEventQueries = (await FirebaseFirestore.instance // 参加イベントメッセージ
            .collection(Strings.USERS)
            .doc(user.uid)
            .collection(Strings.JOIN_EVENTS)
            .get())
        .docs;

    await createTalkMessageData(talkQueries, messages);

    await createGroupMessageData(groupQueries, messages);

    await createHeldEventMessageData(heldEventQueries, messages);

    await createJoinEventMessageData(joinEventQueries, messages);

    state = MessageTabState(messages: messages);
  }

  Future<void> loadTalk(String messageId) async {
    final currentState = state;

    List<MessageDetail> messages = [];

    DocumentSnapshot messageDoc = (await FirebaseFirestore.instance // フレンドメッセージを取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.TALKS)
        .doc(messageId)
        .get());

    String image; // 画像
    String name; // 名前
    String uid; // uid
    String id; // id
    String type; // タイプ
    String message; // メッセージ
    Timestamp create; // 作成日
    Timestamp read; // 確認日
    Timestamp update; // 更新日
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

    if (currentState is MessageTabStateData) {
      currentState.messages.forEach((element) {
        if (element.id == messageId) {
          messages.add(detail);
        } else {
          messages.add(element);
        }
      });
    }

    state = MessageTabState(messages: messages);
  }

  Future<void> loadGroup(String messageId) async {
    final currentState = state;

    List<MessageDetail> messages = [];

    DocumentSnapshot messageDoc = (await FirebaseFirestore.instance // フレンドメッセージを取得
        .collection(Strings.USERS)
        .doc(user.uid)
        .collection(Strings.GROUPS)
        .doc(messageId)
        .get());

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

    if (currentState is MessageTabStateData) {
      currentState.messages.forEach((element) {
        if (element.id == messageId) {
          messages.add(detail);
        } else {
          messages.add(element);
        }
      });
    }

    state = MessageTabState(messages: messages);
  }

  Future<void> reload(List<MessageDetail> afterMessages) async {
    final currentState = state;

    if (currentState is MessageTabStateData) {
      // 直前のメッセージを取得
      final beforeMessages = currentState.messages;

      // 更新するか判定
      bool flag = false;

      // メッセージが増えているか判定
      if (beforeMessages.length != afterMessages.length) {
        flag = true;
      }

      // メッセージを比較
      Map<String, int> beforeMap = {};

      beforeMessages.forEach((message) {
        beforeMap.addAll({message.id: message.sum});
      });

      Map<String, int> afterMap = {};

      afterMessages.forEach((message) {
        afterMap.addAll({message.id: message.sum});
      });

      beforeMap.forEach((beforeId, beforeSum) {
        if (afterMap.containsKey(beforeId)) {
          int afterSum = afterMap[beforeId];

          if (beforeSum != afterSum) {
            flag = true;
          }
        } else {
          flag = true;
        }
      });

      // メッセージが増えているか判定
      if (flag) {
        state = currentState.copyWith(messages: afterMessages);
      } else {
        flag = false;
      }

      // 内容が更新されているか判定
    }
  }
}
