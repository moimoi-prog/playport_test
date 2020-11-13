import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playport_test/data/Strings.dart';
import 'package:playport_test/data/Event.dart';
import 'package:playport_test/state/eventListTab/EventListTabState.dart';
import 'package:playport_test/module/EventModule.dart';
import 'package:state_notifier/state_notifier.dart';

class EventListTabNotifier extends StateNotifier<EventListTabState> with LocatorMixin {
  EventListTabNotifier() : super(const EventListTabState.loading());

  @override
  void initState() async {
    super.initState();

    QuerySnapshot queries = await FirebaseFirestore.instance.collection(Strings.EVENTS).orderBy(Strings.TIMESTAMP, descending: true).get();

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

    // ScrollControllerを静止え
    ScrollController controller = ScrollController();

    // EVENTSテーブルからイベントデータを取得
    state = EventListTabState(
      events: list,
      controller: controller
    );
  }

  void reload() async {
    final currentState = state;

    QuerySnapshot queries = await FirebaseFirestore.instance.collection(Strings.EVENTS).orderBy(Strings.TIMESTAMP, descending: true).get();

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
    if (currentState is EventListTabStateData) {
      state = currentState.copyWith(
          events: list,
        controller: currentState.controller
      );
    }
  }
}