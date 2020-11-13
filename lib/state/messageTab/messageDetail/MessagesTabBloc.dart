import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/module/MessageModule.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabNotifier.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../data/MessageDetail.dart';
import 'MessageTabModule.dart';

class MessagesTabBloc {
  // Firestore用Stream
  final Stream<QuerySnapshot> _talksStream = FirebaseFirestore.instance // フレンドメッセージ
      .collection(Strings.USERS)
      .doc(user.uid)
      .collection(Strings.TALKS)
      .snapshots();

  final Stream<QuerySnapshot> _groupStream = FirebaseFirestore.instance // グループメッセージ
      .collection(Strings.USERS)
      .doc(user.uid)
      .collection(Strings.GROUPS)
      .snapshots();

  final Stream<QuerySnapshot> _heldEventsStream = FirebaseFirestore.instance // 主催イベントメッセージ
      .collection(Strings.USERS)
      .doc(user.uid)
      .collection(Strings.HELD_EVENTS)
      .snapshots();

  final Stream<QuerySnapshot> _joinEventsStream = FirebaseFirestore.instance // 参加イベントメッセージ
      .collection(Strings.USERS)
      .doc(user.uid)
      .collection(Strings.JOIN_EVENTS)
      .snapshots();

  // メッセージデータ用Stream
  final _talkMessageController = StreamController<List<MessageDetail>>();

  // 入力用sinkのGetter
  StreamSink<List<MessageDetail>> get sinkTalkMessage => _talkMessageController.sink;

  // 出力用streamのGetter
  Stream<List<MessageDetail>> get streamTalkMessage => _talkMessageController.stream;

  MessagesTabBloc(BuildContext context) {
    // Firestore用ストリームをまとめて、リッスン
    CombineLatestStream.list([
      _talksStream, // フレンド
      _groupStream, // グループ
      _heldEventsStream, // 主催イベント
      _joinEventsStream // 参加イベント
    ]).listen((messageQueries) {
      _create(messageQueries);
    });

    streamTalkMessage.listen((messages) => Provider.of<MessageTabNotifier>(context, listen: false).reload(messages));
  }

  _create(List<QuerySnapshot> messageQueries) async {
    // Messageリストを生成
    List<MessageDetail> messages = [];

    // フレンドメッセージを生成
    await createTalkMessageData(messageQueries[0].docs, messages);

    // グループメッセージを生成
    await createGroupMessageData(messageQueries[1].docs, messages);

    // 主催イベントメッセージを生成
    await createHeldEventMessageData(messageQueries[2].docs, messages);

    // 参加イベントメッセージを生成
    await createJoinEventMessageData(messageQueries[3].docs, messages);

    // ストリームへ流す
    sinkTalkMessage.add(messages);

  }

  // 終了
  void dispose() {
    _talkMessageController.close();
  }
}
