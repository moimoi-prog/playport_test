import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:playport_test/state/battleHeldPage/BattleHeldNotifier.dart';
import 'package:playport_test/state/battleHeldPage/BattleHeldState.dart';
import 'package:playport_test/state/createGroupPage/CreateGroupNotifier.dart';
import 'package:playport_test/state/createGroupPage/CreateGroupState.dart';
import 'package:playport_test/state/eventHeldListPage/EventHeldListNotifier.dart';
import 'package:playport_test/state/eventHeldListPage/EventHeldListState.dart';
import 'package:playport_test/state/eventJoinListPage/EventJoinListNotifier.dart';
import 'package:playport_test/state/eventJoinListPage/EventJoinListState.dart';
import 'package:playport_test/state/eventListTab/EventListTabNotifier.dart';
import 'package:playport_test/state/eventListTab/EventListTabState.dart';
import 'package:playport_test/state/meetingHeldPage/MeetingHeldNotifier.dart';
import 'package:playport_test/state/meetingHeldPage/MeetingHeldState.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabNotifier.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessageTabState.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsNotifier.dart';
import 'package:playport_test/state/shoutCommentBottomSheetState/ScbsState.dart';
import 'package:playport_test/state/shoutDetailPageState/ShoutDetailPageNotifier.dart';
import 'package:playport_test/state/shoutDetailPageState/ShoutDetailPageState.dart';
import 'package:playport_test/state/shoutListTab/ShoutListNotifier.dart';
import 'package:playport_test/state/shoutListTab/ShoutListState.dart';
import 'package:playport_test/state/userListTab/UserListTabNotifier.dart';
import 'package:playport_test/state/userListTab/UserListTabState.dart';
import 'package:provider/provider.dart';

import 'app/page/main/LoginPage.dart';
import 'app/page/main/SplashPage.dart';
import 'app/page/main/MainPage.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      StateNotifierProvider<BattleHeldStateNotifier, BattleHeldState>(
        create: (context) => BattleHeldStateNotifier(),
      ),
      StateNotifierProvider<CreateGroupNotifier, CreateGroupState>(
        create: (context) => CreateGroupNotifier(),
      ),
      StateNotifierProvider<MeetingHeldStateNotifier, MeetingHeldState>(
        create: (context) => MeetingHeldStateNotifier(),
      ),
      StateNotifierProvider<ScbsNotifier, ScbsState>(
        create: (context) => ScbsNotifier(),
      ),
      StateNotifierProvider<ShoutDetailPageNotifier, ShoutDetailPageState>(
        create: (context) => ShoutDetailPageNotifier(),
      ),
      StateNotifierProvider<UserListTabNotifier, UserListTabState>(
        create: (context) => UserListTabNotifier(),
      ),
      StateNotifierProvider<ShoutListNotifier, ShoutListState>(
        create: (context) => ShoutListNotifier(),
      ),
      StateNotifierProvider<MessageTabNotifier, MessageTabState>(
        create: (context) => MessageTabNotifier(),
      ),
      StateNotifierProvider<EventListTabNotifier, EventListTabState>(
        create: (context) => EventListTabNotifier(),
      ),
      StateNotifierProvider<EventHeldListNotifier, EventHeldListState>(
        create: (context) => EventHeldListNotifier(),
      ),
      StateNotifierProvider<EventJoinListNotifier, EventJoinListState>(
        create: (context) => EventJoinListNotifier(),
      ),
    ],
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.dark,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          routes: <String, WidgetBuilder>{
            "/": (_) => SplashPage(),
            "/login": (_) => LoginPage(),
            "/main": (_) => MainPage(),
          },
        ));
  }
}
