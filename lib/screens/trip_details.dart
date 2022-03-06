// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bagtrackerpro/widgets/bag_card.dart';
import 'package:bagtrackerpro/screens/bag_details.dart';
import 'package:bagtrackerpro/screens/track.dart';
import 'package:bagtrackerpro/classes/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TripDetails extends StatelessWidget {
  int counter = 0;
  Trip tripDetails;
  TripDetails({Key? key, required this.tripDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                '${tripDetails.startCity} to ${tripDetails.endCity}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Color(0xFF633F87),
            ),
          ),
        ),
        backgroundColor: Color(0xFF450783),
      ),
      body: Column(
        children: [
          Image.asset('images/waitingforairplane.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${tripDetails.startAirport}',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SvgPicture.asset('images/Avion.svg'),
                Text(
                  '${tripDetails.endAirport}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aug 14',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '12:15 PM',
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF7B5A9C).withOpacity(.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Text(
                      'Checked in bags',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    for (var i = 0; tripDetails.bags.length > i; i++)
                      BagCard(
                        bag: tripDetails.bags[i],
                        trip: tripDetails,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
