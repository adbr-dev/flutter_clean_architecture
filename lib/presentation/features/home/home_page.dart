import 'package:flutter/material.dart';

import '../../../data/repositories/search_repository_impl.dart';
import '../../utils/util_colors.dart';
import '../bookmark/bookmark_screen.dart';
import '../search/search_controller.dart';
import '../search/search_screen.dart';

enum HomePageTab {
  search,
  bookmark,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _tabIndex;

  late List<Widget> _tabScreens;

  @override
  void initState() {
    super.initState();

    final searchController = SearchController(
      SearchRepositoryImpl(),
    );

    _tabIndex = HomePageTab.search.index;
    _tabScreens = <Widget>[
      SearchScreen(
        controller: searchController,
      ),
      const BookmarkScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabScreens[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: UtilColors.main,
        unselectedItemColor: Colors.grey[400],
        onTap: (value) {
          _tabIndex = value;
          setState(() {});
        },
        currentIndex: _tabIndex,
        items: _bottomNaviationBarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get _bottomNaviationBarItems {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: '검색',
      ),
      const BottomNavigationBarItem(
        activeIcon: Icon(Icons.star),
        icon: Icon(Icons.star_border),
        label: '즐겨찾기',
      ),
    ];
  }
}
