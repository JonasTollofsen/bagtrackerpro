// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

AppBar buildCustomAppBar({String? headerTitle, String? subTitle}) {
  return AppBar(
    title: headerTitle == null ? Text('') : Text(headerTitle),
    bottom: PreferredSize(
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
          color: Color(0xFF633F87),
        ),
      ),
    ),
    backgroundColor: Color(0xFF450783),
  );
}
