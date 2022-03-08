// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/screens/current_trips.dart';
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
  ListView listOfTrips = ListView();
  late List<TripCard> listOfTripCards;

  bool seeAllSelected = false;
  List<Trip>? activeTrips;
  int? amountOfTrips = loggedInUser.trips?.length;

  @override
  initState() {
    listOfTripCards = List.generate(
      loggedInUser.trips!.length,
      (index) => TripCard(
        trip: loggedInUser.trips![index],
      ),
    );

    listOfTrips = ListView(
      children: [
        for (var i = 0; listOfTripCards.length > i; i++) listOfTripCards[i],
      ],
    );
    for (var i = 0; loggedInUser.trips!.length > i; i++) {
      listOfTripCards.add(
        TripCard(
          trip: loggedInUser.trips![i],
        ),
      );
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: buildAppBar(),
          body: TabBarView(
            children: [
              CurrentTrips(),
              CurrentTrips(),
            ],
          )),
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
          child: TabBar(
            labelStyle: TextStyle(
              fontSize: 20,
            ),
            tabs: [
              Tab(
                text: 'Current (${loggedInUser.trips?.length})',
              ),
              Tab(
                text: 'See all(${loggedInUser.trips?.length})',
              ),
            ],
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
