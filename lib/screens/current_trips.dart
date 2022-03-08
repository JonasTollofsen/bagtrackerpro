import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../classes/trip.dart';
import '../globals.dart';
import '../widgets/trip_card.dart';

class CurrentTrips extends StatefulWidget {
  const CurrentTrips({Key? key}) : super(key: key);

  @override
  State<CurrentTrips> createState() => _CurrentTripsState();
}

class _CurrentTripsState extends State<CurrentTrips> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: RefreshIndicator(
        color: Color(0xFF450783),
        semanticsLabel: 'test',
        onRefresh: pullRefresh,
        child: listOfTrips!,
      ),
    );
  }

  Future<void> pullRefresh() async {
    print('pulling refresh');

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
    await Future.delayed(
      Duration(seconds: 2),
    );
    setState(() {});
  }
}
