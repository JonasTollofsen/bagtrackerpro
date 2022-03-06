// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/widgets/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:bagtrackerpro/globals.dart';

class Track extends StatefulWidget {
  Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  bool currentSelected = true;

  bool seeAllSelected = false;
  List<Trip>? activeTrips;
  int? amountOfTrips = loggedInUser.trips?.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            if (currentSelected = true)
              for (var i = 0; loggedInUser.trips!.length > i; i++)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TripCard(
                    trip: loggedInUser.trips![i],
                  ),
                ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Track my Bag'),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: Container(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    seeAllSelected = false;
                    currentSelected = true;
                    setState(() {});
                  },
                  child: Text(
                    'Current(${loggedInUser.trips!.length})',
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          currentSelected == true ? Colors.white : Colors.grey,
                      fontWeight: currentSelected == true
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    seeAllSelected = true;
                    currentSelected = false;
                    setState(() {});
                  },
                  child: Text(
                    'See all(${loggedInUser.trips!.length})',
                    style: TextStyle(
                        fontSize: 20,
                        color:
                            seeAllSelected == true ? Colors.white : Colors.grey,
                        fontWeight: seeAllSelected == true
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Color(0xFF633F87),
          ),
        ),
      ),
      backgroundColor: Color(0xFF450783),
    );
  }
}
