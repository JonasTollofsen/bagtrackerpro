// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/constants.dart';
import 'package:bagtrackerpro/screens/additional_information.dart';
import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'add_bag.dart';

enum TypeofReport { damaged, missing }

class ChooseBagReport extends StatefulWidget {
  ChooseBagReport({Key? key}) : super(key: key);

  @override
  State<ChooseBagReport> createState() => _ChooseBagReportState();
}

class _ChooseBagReportState extends State<ChooseBagReport> {
  TypeofReport? report = TypeofReport.damaged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        headerTitle: 'Report bag',
        subTitle: 'Create new report',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What would you like to report?',
              style: TextStyle(
                fontSize: header1Size,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text('Lost or delayed bag'),
              leading: Radio<TypeofReport>(
                activeColor: primaryColorLight,
                value: TypeofReport.missing,
                groupValue: report,
                onChanged: (TypeofReport? value) {
                  setState(() {
                    report = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Damaged bag'),
              contentPadding: EdgeInsets.all(0),
              leading: Radio<TypeofReport>(
                activeColor: primaryColorLight,
                value: TypeofReport.damaged,
                groupValue: report,
                onChanged: (TypeofReport? value) {
                  setState(() {
                    report = value;
                  });
                },
              ),
            ),
            Text(
              'Report a different bag',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
              ],
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

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  TypeofReport? report = TypeofReport.damaged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Damaged'),
      leading: Radio<TypeofReport>(
        value: TypeofReport.damaged,
        groupValue: report,
        onChanged: (TypeofReport? value) {
          setState(() {
            report = value;
          });
        },
      ),
    );
  }
}
