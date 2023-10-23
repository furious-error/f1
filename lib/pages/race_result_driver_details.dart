import 'package:flutter/material.dart';

class RaceResultDriverDetails extends StatefulWidget {
  final String? givenName,
      familyName,
      code,
      number,
      points,
      constructorName,
      startingGrid,
      lapsCompleted,
      fastestLaptime,
      fastestLapRank;
  const RaceResultDriverDetails({
    super.key,
    required this.givenName,
    required this.familyName,
    required this.code,
    required this.number,
    required this.points,
    required this.constructorName,
    required this.startingGrid,
    required this.lapsCompleted,
    required this.fastestLaptime,
    required this.fastestLapRank,
  });

  @override
  State<RaceResultDriverDetails> createState() =>
      _RaceResultDriverDetailsState();
}

class _RaceResultDriverDetailsState extends State<RaceResultDriverDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.givenName} ${widget.familyName}'),
      ),
      body: Column(
        children: [
          Text('code ${widget.code}'),
          Text('constructor name ${widget.constructorName}'),
          Text('number ${widget.number}'),
          Text('points ${widget.points}'),
          widget.startingGrid == '0' ? Text(' Grid - Pit Start'): Text('grid ${widget.startingGrid}'),
          Text('laps completed ${widget.lapsCompleted}'),
          Text('fastest lap time ${widget.fastestLaptime}'),
          widget.fastestLapRank == '1'? Text('${widget.givenName} ${widget.familyName} set the fastest lap for the race') : const SizedBox(),
        ],
      ),
    );
  }
}
