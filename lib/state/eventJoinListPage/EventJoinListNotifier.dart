import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/state/eventJoinListPage/EventJoinListState.dart';
import 'package:playport_test/module/EventModule.dart';
import 'package:state_notifier/state_notifier.dart';

class EventJoinListNotifier extends StateNotifier<EventJoinListState> with LocatorMixin {
  EventJoinListNotifier() : super(const EventJoinListState.loading());

  @override
  void initState() async {
    super.initState();

    // 参加しているイベント一覧
    QuerySnapshot queries = await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.JOIN_EVENTS).get();

    List<Event> events = [];
    List<String> status = [];

    for (DocumentSnapshot joinEventDoc in queries.docs) {
      // ステータスを格納
      status.add(joinEventDoc.data()[Strings.STATUS]);

      // 参加しているイベントの詳細情報を取得
      DocumentSnapshot eventDoc = await FirebaseFirestore.instance.collection(Strings.EVENTS).doc(joinEventDoc.id).get();

      switch (eventDoc.data()[Strings.TYPE]) {
        case Strings.BATTLE:
          events.add(createBattle(eventDoc));
          break;

        case Strings.MEETING:
          events.add(createMeeting(eventDoc));
          break;
      }
    }

    // EVENTSテーブルからイベントデータを取得
    state = EventJoinListState(events: events, status: status);
  }

  void reload() async {
    final currentState = state;

    // 参加しているイベント一覧
    QuerySnapshot queries = await FirebaseFirestore.instance.collection(Strings.USERS).doc(user.uid).collection(Strings.JOIN_EVENTS).get();

    List<Event> events = [];
    List<String> status = [];

    for (DocumentSnapshot joinEventDoc in queries.docs) {
      // ステータスを格納
      status.add(joinEventDoc.data()[Strings.STATUS]);

      // 参加しているイベントの詳細情報を取得
      DocumentSnapshot eventDoc = await FirebaseFirestore.instance.collection(Strings.EVENTS).doc(joinEventDoc.id).get();

      switch (eventDoc.data()[Strings.TYPE]) {
        case Strings.BATTLE:
          events.add(createBattle(eventDoc));
          break;

        case Strings.MEETING:
          events.add(createMeeting(eventDoc));
          break;
      }
    }

    // EVENTSテーブルからイベントデータを取得
    if (currentState is EventJoinListStateData) {
      state = currentState.copyWith(events: events);
    } else {
      state = EventJoinListState(events: events);
    }
  }
}
