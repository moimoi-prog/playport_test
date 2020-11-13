import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';

import '../data/Battle.dart';
import '../data/Meeting.dart';

// --------------------------------
// 処理名　: createBattle
// 処理概要: ドキュメントからBattleを生成する
// --------------------------------
Battle createBattle(DocumentSnapshot d){
  // Battleデータを生成
  Battle battleData = Battle(
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

  // Battleデータを返却
  return battleData;
}

// --------------------------------
// 処理名　: createMeeting
// 処理概要: ドキュメントからMeetingを生成する
// --------------------------------
Meeting createMeeting(DocumentSnapshot d){
  // Meetingデータを生成
  Meeting battleData = Meeting(
      uid: d.data()[Strings.ORGANIZER],
      id: d.id,
      title: d.data()[Strings.TITLE],
      content: d.data()[Strings.CONTENT],
      game: d.data()[Strings.GAME],
      official: d.data()[Strings.OFFICIAL],
      type: d.data()[Strings.TYPE],
      remarks: d.data()[Strings.REMARKS],
      timestamp: d.data()[Strings.TIMESTAMP].toDate(),
      held: d.data()[Strings.HELD].toDate(),
      deadLine: d.data()[Strings.DEADLINE].toDate()
  );

  // Meetingデータを返却
  return battleData;
}