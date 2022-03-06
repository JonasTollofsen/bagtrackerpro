// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bagtrackerpro/classes/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';

import '../classes/bag.dart';

class BagDetails extends StatelessWidget {
  Trip trip;
  Bag bag;
  BagDetails({
    Key? key,
    required this.bag,
    required this.trip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bag Details'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                '${trip.startCity} to ${trip.endCity}',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Color(0xFF633F87),
            ),
          ),
        ),
        backgroundColor: Color(0xFF450783),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  trip.startAirport,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  'images/Avion.svg',
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  trip.endAirport,
                  style: TextStyle(
                    fontSize: 20,
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
                trip.startDate,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                trip.startTime,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Text(
            'bagtag #${bag.bagTagNumber}',
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFB),
              ),
              child: BagTimeLine(
                bag: bag,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BagTimeLine extends StatefulWidget {
  Bag bag;
  BagTimeLine({
    Key? key,
    required this.bag,
  }) : super(key: key);

  @override
  State<BagTimeLine> createState() => _BagTimeLineState();
}

class _BagTimeLineState extends State<BagTimeLine> {
  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        color: Colors.green,
        indicatorTheme: IndicatorThemeData(
          size: 20,
        ),
        connectorTheme: ConnectorThemeData(
          thickness: 5,
        ),
      ),
      builder: TimelineTileBuilder(
        contentsAlign: ContentsAlign.reverse,
        contentsBuilder: (context, index) => TimelineTile(
          oppositeContents: Text(widget.bag.bagStatus[index].airportCode),
          contents: Text(widget.bag.bagStatus[index].longDescription),
          node: TimelineNode(
            indicator: DotIndicator(),
            startConnector: SolidLineConnector(),
            endConnector: SolidLineConnector(),
          ),
        ),
        itemCount: widget.bag.bagStatus.length,
      ),
    );
  }
}
