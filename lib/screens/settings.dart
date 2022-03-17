import 'package:bagtrackerpro/screens/login_screen.dart';
import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Connections',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: secondaryColorLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Service(
                    image: 'images/kayak.png',
                  ),
                  Service(image: 'images/lufthansa.png'),
                  Service(
                    image: 'images/airfrance.png',
                    size: 40,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50), primary: primaryColorLight),
              onPressed: () {},
              child: Text(
                'Connect new service',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Service extends StatefulWidget {
  String image;
  double? size;
  Service({
    required this.image,
    this.size,
  });

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.image,
            width: widget.size ?? 110,
          ),
          CupertinoSwitch(
            activeColor: primaryColorDark,
            value: state,
            onChanged: (value) {
              state = value;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
