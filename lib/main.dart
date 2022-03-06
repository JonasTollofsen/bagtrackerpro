// ignore_for_file: prefer_const_constructors

import 'package:bagtrackerpro/screens/add_bag.dart';
import 'package:bagtrackerpro/screens/login_screen.dart';
import 'package:bagtrackerpro/screens/profile.dart';
import 'package:bagtrackerpro/screens/report.dart';
import 'package:bagtrackerpro/screens/settings.dart';
import 'package:bagtrackerpro/screens/track.dart';
import 'package:bagtrackerpro/screens/trip_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      initialRoute: '/',
      routes: {
        '/track': (context) => Track(),
        '/report': (context) => Report(),
        '/addbag': (context) => AddBag(),
        '/profile': (context) => Profile(),
        '/settings': (context) => Settings(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      popAllScreensOnTapOfSelectedTab: true,
      navBarStyle: NavBarStyle.style15,
      backgroundColor: Color(0xFF450783),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    Track(),
    Report(),
    AddBag(),
    Profile(),
    Settings(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ("Track"),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.fileAlt),
      title: ("Report"),
      activeColorPrimary: CupertinoColors.white,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 50,
      inactiveColorSecondary: Color(0xFFE5DEEB),
      icon: Icon(
        CupertinoIcons.add_circled_solid,
        color: Color(0xFF450783),
      ),
      activeColorPrimary: CupertinoColors.white,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(FontAwesomeIcons.user),
      title: ("Profile"),
      activeColorPrimary: CupertinoColors.white,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ("Settings"),
      activeColorPrimary: CupertinoColors.white,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
