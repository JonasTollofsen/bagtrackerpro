// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/screens/additional_information.dart';
import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'add_bag.dart';

class ChooseBagReport extends StatelessWidget {
  const ChooseBagReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildCustomAppBar(headerTitle: 'Report bag', subTitle: 'Choose bag'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add another bag',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search with booking ID'),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  'Airline',
                  style: TextStyle(fontSize: 22),
                ),
                children: [
                  AirlineDesc(
                    image: 'images/sas.png',
                    airlineName: 'SAS - Scandinavian Airlines',
                  ),
                  AirlineDesc(
                      airlineName: 'DLH - Lufthansa',
                      image: 'images/lufthansa.png'),
                  AirlineDesc(
                    airlineName: 'AFR - Air France',
                    image: 'images/airfrance.png',
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: AdditionalInformation(),
                );
              },
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 170,
                    minHeight: 50,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(
                      0xFF633F87,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
