// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bagtrackerpro/screens/add_bag.dart';
import 'package:bagtrackerpro/screens/login_screen.dart';
import 'package:bagtrackerpro/screens/profile.dart';
import 'package:bagtrackerpro/screens/report.dart';
import 'package:bagtrackerpro/screens/settings.dart';
import 'package:bagtrackerpro/screens/track.dart';
import 'package:bagtrackerpro/screens/trip_details.dart';
import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StartApp(),
  );
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      Track(),
      Report(),
      AddBag(),
      Profile(),
      Settings(),
    ];
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        unselectedItemColor: Color(0xFF9CA3AF),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF450783),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Track'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

/*
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
PersistentTabController _controller;
_controller = PersistentTabController(initialIndex: 0);
return PersistentTabView(
context,
controller: _controller,
screens: _buildScreens(),
items: _navBarsItems(),
popAllScreensOnTapOfSelectedTab: true,
navBarStyle: NavBarStyle.style14,
backgroundColor: Color(0xFF450783),
decoration: NavBarDecoration(
borderRadius: BorderRadius.circular(10.0),
),
)*/
