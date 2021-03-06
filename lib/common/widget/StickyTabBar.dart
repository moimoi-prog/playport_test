import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ----------------------------------------
// StyckyTabBar
// 画面の途中からBottmnNavigationBarを表示するやつ
// ----------------------------------------
class StickyTabBar extends StatelessWidget {
  // 引数
  /* タブヘッダー      */ final List<Widget> tabHeader;
  /* タブコントローラー */ final TabBar tabBar;
  /* タブボディー      */ final TabBarView tabBarView;
  /* スクロール       */ final bool pinned;

  // コンストラクタ
  StickyTabBar({
    Key key,
    this.tabHeader,
    this.tabBar,
    this.tabBarView,
    this.pinned = true}
    ) : assert(tabHeader != null),
        assert(tabBar != null),
        assert(tabBarView != null),
        assert(tabBar.tabs.length == tabBarView.children.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBar.tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                tabHeader
              ),
            ),
            SliverPersistentHeader(
              pinned: pinned,
              delegate: _StickyTabBarDelegate(
                tabBar
              ),
            ),

          ];
        },
        body: tabBarView
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(color: Theme.of(context).primaryColor, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
