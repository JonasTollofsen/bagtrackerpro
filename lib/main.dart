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
import 'package:flutter/widgets.dart';
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
  bool? trackSelected = true;
  bool? reportSelected;
  bool? profileSelected;
  bool? connectSelected;
  Widget currentPage = Track();

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
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
        icon: Icon(Icons.luggage_outlined),
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
        activeColorPrimary: Colors.white,
        icon: Image.asset(
          'images/add.png',
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.user),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.plug),
        title: ("Connect"),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

/*Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => _pages.elementAt(_selectedIndex),
          );
        },
      ),
      bottomNavigationBar:
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FittedBox(
          child: FloatingActionButton(
            child: Image.asset('images/add_button.png'),
            onPressed: () {
              setState(() {
              });
            },
            elevation: 4,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );*/

/*Stack(
        children: [
          BottomNavigationBar(
            iconSize: 28,
            fixedColor: Colors.white,
            unselectedItemColor: Color(0xFF9CA3AF),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF450783),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.luggage_outlined,
                  ),
                  label: 'Track'),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.fileAlt),
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
                icon: Icon(FontAwesomeIcons.plug),
                label: 'Connect',
              ),
            ],
          ),
        ],
      ),*/

/*BottomAppBar(
        color: Color(0xFF450783),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: iconsize,
              icon: Icon(
                Icons.luggage_outlined,
                color:
                    widget.trackSelected == true ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  widget.trackSelected = true;
                  widget.reportSelected = false;
                  widget.profileSelected = false;
                  widget.connectSelected = false;
                  currentPage = Track();
                });
              },
            ),
            IconButton(
              iconSize: iconsize,
              icon: Icon(
                FontAwesomeIcons.fileAlt,
                color:
                    widget.reportSelected == true ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  widget.trackSelected = false;
                  widget.reportSelected = true;
                  widget.profileSelected = false;
                  widget.connectSelected = false;
                  currentPage = Report();
                });
              },
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              iconSize: iconsize,
              icon: Icon(
                FontAwesomeIcons.user,
                color:
                    widget.profileSelected == true ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  widget.trackSelected = false;
                  widget.reportSelected = false;
                  widget.profileSelected = true;
                  widget.connectSelected = false;
                  currentPage = Profile();
                });
              },
            ),
            IconButton(
              iconSize: iconsize,
              icon: Icon(
                FontAwesomeIcons.plug,
                color:
                    widget.connectSelected == true ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  widget.trackSelected = false;
                  widget.reportSelected = false;
                  widget.profileSelected = false;
                  widget.connectSelected = false;
                  currentPage = Settings();
                });
              },
            )
          ],
        ),
      ),*/
