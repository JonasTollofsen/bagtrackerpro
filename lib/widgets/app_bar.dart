// ignore_for_file: prefer_const_constructors

import 'package:bagtrackerpro/constants.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar(
    {String? headerTitle, String? subTitle, bool? hidesubtitle}) {
  return AppBar(
    title: headerTitle == null
        ? Text('')
        : Text(
            headerTitle,
            style: TextStyle(fontSize: 30),
          ),
    bottom: hidesubtitle == false
        ? null
        : PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: subTitle == null
                    ? Text('')
                    : Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: primaryColorLight,
              ),
            ),
          ),
    backgroundColor: primaryColorDark,
  );
}
