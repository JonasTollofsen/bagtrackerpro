// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/classes/bag_status.dart';
import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/constants.dart';
import 'package:bagtrackerpro/globals.dart';
import 'package:bagtrackerpro/screens/track.dart';
import 'package:bagtrackerpro/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../classes/airline.dart';
import '../classes/bag.dart';
import '../widgets/app_bar.dart';

class AddBag extends StatelessWidget {
  const AddBag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        subTitle: 'Add bag for tracking',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search with booking ID'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Card(
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
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('We found the following booking'),
                  content: Text('testest'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'cancel'),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        loggedInUser.trips!.add(
                          Trip(
                            startDate: '5 January, 2022',
                            startCity: 'Gothenburg',
                            endCity: 'Berlin',
                            bookingNumber: 'ACOPB9',
                            bags: [
                              Bag(
                                bagStatus: [
                                  BagStatus(
                                      status: 'Loaded',
                                      updateTime: '14:00',
                                      longDescription:
                                          'Your luggage is loaded on the aircraft',
                                      airportCode: 'ABC1232',
                                      onTrack: true)
                                ],
                                bagTagNumber: 7009932211,
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 40,
              ),
              child: Text(
                'Add bag',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AirlineDesc extends StatelessWidget {
  String airlineName;
  String image;
  AirlineDesc({
    required this.airlineName,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(airlineName),
          Image.asset(
            image,
            width: 55,
          ),
        ],
      ),
    );
  }
}
