import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/features/bookmark/bookmark_screen.dart';
import 'package:flutter_clean_architecture/presentation/features/search/search_screen.dart';
import 'package:flutter_clean_architecture/presentation/utils/util_colors.dart';

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
  final _tabScreens = const <Widget>[
    SearchScreen(),
    BookmarkScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabIndex = HomePageTab.search.index;
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
