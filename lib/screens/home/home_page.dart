import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/screens/home/home_screen.dart';
import 'package:flutter_cinema_app/screens/home/location_screen.dart';
import 'package:flutter_cinema_app/screens/home/profile_screen.dart';
import 'package:flutter_cinema_app/screens/home/search/search_screen.dart';
import 'package:flutter_cinema_app/screens/home/ticket_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late CircularBottomNavigationController _navigationController;
  List<Widget> screens = [
    const Home(),
    const Search(),
    const Location(),
    const Ticket(),
    const Profile()
  ];
  static const IconData ticket = IconData(0xf916,
      fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons');
  List<TabItem> tabItems = [
    iconItems(Icons.home),
    iconItems(Icons.search),
    iconItems(Icons.menu),
    iconItems(ticket),
    iconItems(Icons.person),
  ];

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(currentIndex);
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 0), // chiều cao bottomNavBar
          child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() => _navigationController.value = index);
              },
              itemBuilder: (BuildContext context, int index) {
                return screens[index];
              }),
        ),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          barBackgroundGradient: AppTheme.purpleGradient, // màu navbottombar
          circleSize: 65,
          circleStrokeWidth: 2,
          normalIconColor: AppTheme.white,
          selectedPos: currentIndex,
          animationDuration: const Duration(milliseconds: 300),
          selectedCallback: (int? index) {
            setState(() {
              _navigationController.value = index;
              _pageController.jumpToPage(index!);
            });
          },
        ));
  }
}

TabItem iconItems(IconData newIcon) {
  return TabItem(newIcon, '', const Color(0xff2d0150).withAlpha(200),
      circleStrokeColor: Colors.greenAccent // màu hình tròn bọc icon
      );
}
