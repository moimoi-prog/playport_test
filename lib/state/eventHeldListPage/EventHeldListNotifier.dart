import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/firebase/GoogleAuthModule.dart';
import 'package:playport_test/state/eventHeldListPage/EventHeldListState.dart';
import 'package:playport_test/module/EventModule.dart';
import 'package:state_notifier/state_notifier.dart';

class EventHeldListNotifier extends StateNotifier<EventHeldListState> with LocatorMixin {
  EventHeldListNotifier() : super(const EventHeldListState.loading());

  @override
  void initState() async {
    super.initState();

    QuerySnapshot queries = await FirebaseFirestore.instance.collection(Strings.EVENTS).where(Strings.ORGANIZER, isEqualTo: user.uid).get();

    List<Event> list = [];

    queries.docs.forEach((eventDoc) {
      switch(eventDoc.data()[Strings.TYPE]) {
        case Strings.BATTLE:
          list.add(createBattle(eventDoc));
          break;

        case Strings.MEETING:
          list.add(createMeeting(eventDoc));
          break;
      }
    });

    // EVENTSテーブルからイベントデータを取得
    state = EventHeldListState(
        events: list
    );
  }

  void reload() async {
    final currentState = state;

    QuerySnapshot queries = await FirebaseFirestore.instance.collection(Strings.EVENTS).where(Strings.ORGANIZER, isEqualTo: user.uid).get();

    List<Event> list = [];

    queries.docs.forEach((eventDoc) {
      switch(eventDoc.data()[Strings.TYPE]) {
        case Strings.BATTLE:
          list.add(createBattle(eventDoc));
          break;

        case Strings.MEETING:
          list.add(createMeeting(eventDoc));
          break;
      }
    });

    // EVENTSテーブルからイベントデータを取得
    if (currentState is EventHeldListStateData) {
      state = currentState.copyWith(
          events: list
      );
    } else {
      state = EventHeldListState(
          events: list
      );
    }

  }
}