import 'package:bagtrackerpro/classes/trip.dart';
import 'package:flutter/material.dart';
import 'package:bagtrackerpro/globals.dart';

class User {
  String username;
  List<Trip>? trips;
  List<Trip>? activeTrips;

  User({
    required this.username,
    this.trips,
  });
}

List<Trip>? FindActiveTrips(List<Trip>? trips) {
  List<Trip>? activeTrips;
  for (var i = 0; trips!.length > i; i++) {
    print('hello');
    if (trips[i].active = true) {
      activeTrips!.add(trips[i]);
      print('hello');
    }
  }
  return activeTrips;
}
