import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';

// ----------------------------------------
// 一番新しいメッセージを取得
// ----------------------------------------
String getMessage(List<DocumentSnapshot> documents) {
  // 最新のメッセージを保存しておく変数
  DocumentSnapshot d;
  int counter = 0;
  while(counter < documents.length) {
    if (documents[counter].data()[Strings.TYPE] == Strings.TEXT || documents[counter].data()[Strings.TYPE] == Strings.IMAGE) {
      d = documents[counter];
      break;
    }
    counter = counter + 1;
  }

  // 最新のメッセージを取得
  while(counter < documents.length) {
    // typeがinfoである場合、飛ばす
    if (documents[counter].data()[Strings.TYPE] == Strings.TEXT || documents[counter].data()[Strings.TYPE] == Strings.IMAGE) {
      if (d.data()[Strings.TIMESTAMP].toDate().isBefore(documents[counter].data()[Strings.TIMESTAMP].toDate())) {
        d = documents[counter];
      }
    }
    counter = counter + 1;
  }

  if (d == null) {
    return "";
  }

  // 最新のメッセージを返却
  switch (d.data()[Strings.TYPE]) {
    case Strings.TEXT:
      return d.data()[Strings.CONTENT];
      break;

    case Strings.IMAGE:
      return "画像が送信されました。";
      break;

    default:
      return "typeがどの条件にも一致しません。";
      break;
  }
}
