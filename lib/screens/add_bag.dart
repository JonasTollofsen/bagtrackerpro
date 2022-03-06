// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/classes/bag_status.dart';
import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                            startCity: 'Gothenburg',
                            endCity: 'Berlin',
                            startAirport: 'Landvetter',
                            endAirport: 'Brandenburg',
                            startDate: '13 March',
                            startTime: '13:00',
                            endDate: '20 march',
                            endTime: '20:00',
                            bookingNumber: 'ACOPB9',
                            lastUpdateDate: '13 March',
                            lastUpdateTime: '14:00',
                            updateName: 'Loaded',
                            airCraftNumber: 'ABC1232',
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
                                startCity: 'Gothenburg',
                                endCity: 'Berlin',
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
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFF623C87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
