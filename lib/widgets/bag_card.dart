// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/classes/trip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../classes/bag.dart';
import '../screens/bag_details.dart';

class BagCard extends StatelessWidget {
  Bag bag;
  Trip trip;
  BagCard({
    required this.bag,
    required this.trip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.chevronDown),
              Text(
                'bagtag #${bag.bagTagNumber}',
              ),
              Row(
                children: [
                  Text(
                    '${bag.bagStatus.last.status}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.checkCircle,
                    color: Colors.green,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last update: ${bag.bagStatus.last.updateTime}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              CustomButton(bag: bag, trip: trip)
            ],
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.bag,
    required this.trip,
  }) : super(key: key);

  final Bag bag;
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: BagDetails(
            bag: bag,
            trip: trip,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 25,
        ),
        child: Text(
          'track',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Color(0xFF623C87),
        ),
      ),
    );
  }
}
