// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bagtrackerpro/constants.dart';
import 'package:bagtrackerpro/screens/choose_bag_report.dart';
import 'package:bagtrackerpro/screens/lost_delayed.dart';
import 'package:bagtrackerpro/screens/track.dart';
import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:bagtrackerpro/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(headerTitle: 'Report bag'),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('images/lost_bag.png', width: 200),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                buttonText: 'New  report',
                screen: ChooseBagReport(),
                buttonColor: primaryColorLight,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: secondaryColorLight,
              ),
              child: RefreshIndicator(
                  color: primaryColorLight,
                  onRefresh: pullRefresh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Previous reports',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Center(
                              child: Text(
                                'You have no reported bags',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> pullRefresh() async {
  await Future.delayed(
    Duration(seconds: 3),
  );
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget? screen;
  final Color? buttonColor;
  CustomButton({
    required this.buttonText,
    this.screen,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        pushNewScreen(context, screen: screen!);
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: 170,
          minHeight: 50,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor ??
              Color(
                0xFF633F87,
              ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
