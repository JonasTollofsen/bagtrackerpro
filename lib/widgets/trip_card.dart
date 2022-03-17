// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/screens/trip_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TripCard extends StatelessWidget {
  Trip trip;
  TripCard({
    required this.trip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(context, screen: TripDetails(tripDetails: trip));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 3),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trip.startDate,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${trip.startCity} to ${trip.endCity}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                Icon(
                  FontAwesomeIcons.chevronRight,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            trip.luggageStatus == LuggageStatus.ok
                ? Row(
                    children: [
                      Text(
                        'Luggage on track',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                        size: 30,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        'Luggage delayed',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'images/warning.png',
                        height: 28,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
