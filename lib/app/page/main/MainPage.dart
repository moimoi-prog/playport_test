import 'package:flutter/material.dart';
import 'package:playport_test/app/drawermenu/DrawerMenu.dart';
import 'package:playport_test/app/page/main/shout/ShoutListTab.dart';
import 'package:playport_test/app/page/main/message/MessagesTab.dart';
import 'package:playport_test/app/page/main/tool/ToolTab.dart';
import 'package:playport_test/firebase/firestore/UsersModule.dart';
import 'package:playport_test/state/messageTab/messageDetail/MessagesTabBlocProvider.dart';

import 'event/tab/EventListTab.dart';
import 'matching/MatchingTab.dart';

// ----------------------------------------
// メインページ
// ----------------------------------------
class MainPage extends StatefulWidget {
  _MainForm createState() => _MainForm();
}

// ----------------------------------------
// メインステータス
// ----------------------------------------
class _MainForm extends State<MainPage> {
  // 変数を宣言
  /* タブインデックス */ int _selectedIndex = 0;
  /* コントローラー　 */ PageController _pageController;


  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );

    // ログインする
    // userLogin();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();

    // ログアウトする
    // userLogout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawerMenu(context),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            MessagesTabBlocProvider(
              child: MessageTab(),
            ),
            ShoutTab(),
            EventListTab(),
            MatchingTab(),
            // MessagesTabView(),
            // EventTabView(),
            // ToolTab()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          // backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.email_outlined), title: Text("メッセージ"),backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(icon: Icon(Icons.article_outlined), title: Text('シャウト'),backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), title: Text('イベント'),backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(icon: Icon(Icons.people_outline), title: Text('マッチング'), backgroundColor: Theme.of(context).primaryColor),
            // BottomNavigationBarItem(icon: Icon(Icons.pan_tool), title: Text('ツール'),backgroundColor: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
