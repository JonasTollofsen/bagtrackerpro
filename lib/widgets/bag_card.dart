// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/screens/bag_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../classes/bag.dart';

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
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                      ),
                      child: Text(
                        'baggage tag #${bag.bagTagNumber}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF374151),
                        ),
                      ),
                    ),
                    bagStatus(trip.luggageStatus),
                  ],
                ),
              ),
              ExpansionTile(
                trailing: SizedBox(),
                title: Text(
                  'Last update: ${bag.bagStatus.last.updateTime}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                    child: trip.luggageStatus == LuggageStatus.ok
                        ? Image.asset('images/timeline_good.png')
                        : Image.asset('images/timeline_bad.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget bagStatus(LuggageStatus? luggageStatus) {
  switch (luggageStatus) {
    case LuggageStatus.ok:
      {
        return status(
          icon: Icons.check_circle_outlined,
          statusText: 'On track',
          iconColor: Colors.green,
        );
      }
  }
  return status(
    statusText: 'Delayed',
    icon: Icons.warning_amber_rounded,
    iconColor: Colors.yellow,
  );
}

class status extends StatelessWidget {
  String statusText;
  IconData icon;
  Color iconColor;
  status({
    required this.statusText,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            statusText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
