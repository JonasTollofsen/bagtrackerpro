// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bagtrackerpro/widgets/app_bar.dart';
import 'package:bagtrackerpro/widgets/bag_card.dart';
import 'package:bagtrackerpro/screens/bag_timeline.dart';
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
      appBar: buildCustomAppBar(
          headerTitle: 'Track',
          subTitle: '${tripDetails.startCity} to ${tripDetails.endCity}'),
      body: Column(
        children: [
          tripDetails.luggageStatus == LuggageStatus.ok
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 35,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Text(
                          'Relax, all your bags are on track',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Icon(
                        Icons.warning,
                        color: Colors.yellow,
                        size: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          'There is a problem with one or more of your bags, see details below',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                child: RefreshIndicator(
                  color: Color(0xFF450783),
                  onRefresh: pullRefresh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Checked in bags',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            for (var i = 0; tripDetails.bags.length > i; i++)
                              BagCard(
                                bag: tripDetails.bags[i],
                                trip: tripDetails,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pullRefresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
  }
}
