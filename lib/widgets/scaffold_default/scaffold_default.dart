import 'package:basic/import.dart';
import 'package:basic/pages/home/page.dart';
import 'package:basic/pages/profile/page.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ScaffoldDefault extends StatefulWidget {
  const ScaffoldDefault({super.key});

  @override
  State<ScaffoldDefault> createState() => _ScaffoldDefaultState();
}

class _ScaffoldDefaultState extends State<ScaffoldDefault> {
  int _indexBottom = 0;
  late List<BottomNavigationBarItem> _bottomItems;

  @override
  void initState() {
    super.initState();
    _setupMenu();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ScaffoldDefault oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _setupMenu() {
    _bottomItems = <BottomNavigationBarItem>[
      _itemBottomNavigation(
        label: 'Trang chủ',
        index: 0,
        assetPath: 'assets/icons/bottom_nav/icon_home.svg',
      ),
      _itemBottomNavigation(
        label: 'Cá nhân',
        index: 1,
        assetPath: 'assets/icons/bottom_nav/icon_user.svg',
      ),
    ];
  }

  BottomNavigationBarItem _itemBottomNavigation({
    required String assetPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Image(
        image: Svg(
          assetPath,
          color: _indexBottom == index
              ? AppColors.primaryColor
              : AppColors.grey90,
        ),
      ),
      label: label,
    );
  }

  Future<void> onItemTappedTabBottom(int index) async {
    setState(() {
      factories['bottomNavigatorIndex'] = index;
      _indexBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[
      const HomePage(),
      const ProfilePage(),
    ];

    if (!empty(factories['bottomNavigatorIndex'])) {
      _indexBottom = parseInt(factories['bottomNavigatorIndex']);
      factories.remove('bottomNavigatorIndex');
    }

    if (_indexBottom >= items.length) {
      _indexBottom = items.length - 1;
    }

    return Scaffold(
      body: items[_indexBottom],
      bottomNavigationBar: _bottomNavigator(),
    );
  }

  Widget _bottomNavigator() {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey50,
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: _bottomItems,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey90,
          selectedLabelStyle: const TextStyle( fontWeight: FontWeight.bold),
          selectedFontSize: 12,
          currentIndex: _indexBottom,
          onTap: (index) => onItemTappedTabBottom(index),
        ),
      ),
    );
  }
}
