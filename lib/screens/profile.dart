// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../main.dart';
import 'login_screen.dart';

enum notificationFrequency {
  high,
  medium,
  low,
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double notificationFrequency = 0;
  String errorMessage = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: buildCustomAppBar(headerTitle: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileRow(text: 'My Account', icon: FontAwesomeIcons.userCircle),
            Divider(
              thickness: 2,
            ),
            ProfileRow(
                text: 'Help & Support', icon: FontAwesomeIcons.questionCircle),
            Divider(
              thickness: 2,
            ),
            ProfileRow(text: 'About App', icon: FontAwesomeIcons.infoCircle),
            Divider(
              thickness: 2,
            ),
            ProfileRow(
              text: 'Log out',
              icon: Icons.logout,
              onTap: user == null
                  ? null
                  : () async {
                      setState(() {
                        isLoading = true;
                        errorMessage = '';
                      });
                      try {
                        await FirebaseAuth.instance.signOut();
                        pushNewScreen(context,
                            screen: LoginScreen(), withNavBar: false);
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message!;
                        setState(() {});
                      }
                      setState(() => isLoading = false);
                    },
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                constraints: BoxConstraints(minHeight: 180),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF7B5A9C).withOpacity(.2),
                ),
                child: Column(
                  children: [
                    Text(
                      'Notification frequency',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      activeColor: Color(0xFF623C87),
                      inactiveColor: Color(0xFF450783).withOpacity(.3),
                      label: labelText(notificationFrequency),
                      value: notificationFrequency,
                      onChanged: (newFrequency) {
                        setState(() => notificationFrequency = newFrequency);
                      },
                      divisions: 2,
                    ),
                    Text(
                      notificationText(notificationFrequency),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  String text;
  Function()? onTap;
  IconData icon;
  ProfileRow({
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: Color(0xFF623C87),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

String labelText(double notificationFrequency) {
  switch (notificationFrequency.toString()) {
    case '0.0':
      {
        return "Deviation";
      }
      ;
    case '0.5':
      {
        return "Important";
      }
    case '1.0':
      {
        return "All";
      }
  }
  return 'null';
}

String notificationText(double notificationFrequency) {
  switch (notificationFrequency.toString()) {
    case '0.0':
      {
        return "We'll only notify you when theres a potential deviation";
      }
      ;
    case '0.5':
      {
        return "We'll notify you on the most important events";
      }
    case '1.0':
      {
        return "We'll notify you on all changes";
      }
  }
  return 'null';
}
