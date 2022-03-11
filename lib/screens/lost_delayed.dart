// ignore_for_file: prefer_const_constructors

import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LostDelayed extends StatelessWidget {
  const LostDelayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
    );
  }
}
