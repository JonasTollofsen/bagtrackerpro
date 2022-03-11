// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../classes/bag.dart';

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
