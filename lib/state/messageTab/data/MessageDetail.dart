import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/enum/MatchingType.dart';

class MessageDetail {
  /* 画像      */ String image;
  /* 名前      */ String name;
  /* uid      */ String uid;
  /* id       */ String id;
  /* タイプ    */ String type;
  /* メッセージ */ String message;
  /* 作成日    */ Timestamp create;
  /* 確認日    */ Timestamp read;
  /* 更新日    */ Timestamp update;
  /* メッセージ数 */ int sum;
}