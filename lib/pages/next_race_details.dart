// import 'package:f1_stats/helper/check_date.dart';
// import 'package:f1_stats/helper/convert_date.dart';
// import 'package:f1_stats/models/next_race_model.dart';
// import 'package:f1_stats/pages/qualifying_results.dart';
// import 'package:f1_stats/pages/race_results.dart';
// import 'package:f1_stats/pages/sprint_results.dart';
// import 'package:flutter/material.dart';

// class NextRaceDetailsPage extends StatefulWidget {
//   final NextRaceModel nrModel;
//   const NextRaceDetailsPage({
//     super.key,
//     required this.nrModel,
//   });

//   @override
//   State<NextRaceDetailsPage> createState() => _NextRaceDetailsPageState();
// }

// class _NextRaceDetailsPageState extends State<NextRaceDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     var dataNextRaceDetails =
//         widget.nrModel.mRData!.raceTable!.races![0];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(dataNextRaceDetails.raceName!),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Text(dataNextRaceDetails.circuit!.location!.country!),
//             Text(dataNextRaceDetails.circuit!.location!.locality!),
//             Text("Round- ${dataNextRaceDetails.round!}"),
//             Text('Circuit Name - ${dataNextRaceDetails.circuit!.circuitName}'),
//             Text('FP1 date - ${convertDateFormat(dataNextRaceDetails.firstPractice!.date!)}'),
//             Text('FP1 time - ${convertTimeFormat(dataNextRaceDetails.firstPractice!.time!)}'),
//             dataNextRaceDetails.toJson()['Sprint'] == null
//                 ? Column(
//                     children: [
//                       Text(
//                           'FP2 date - ${convertDateFormat(dataNextRaceDetails.secondPractice!.date!)}'),
//                       Text(
//                           'FP2 time - ${convertTimeFormat(dataNextRaceDetails.secondPractice!.time!)}'),
//                       Text(
//                           'FP3 date - ${convertDateFormat(dataNextRaceDetails.thirdPractice!.date!)}'),
//                       Text(
//                           'FP3 time - ${convertTimeFormat(dataNextRaceDetails.thirdPractice!.time!)}'),
//                       Text(
//                           'Qualifying date - ${convertDateFormat(dataNextRaceDetails.qualifying!.date!)}'),
//                       Text(
//                           'Qualifying time - ${convertTimeFormat(dataNextRaceDetails.qualifying!.time!)}'),
//                     ],
//                   )
//                 : Column(
//                     children: [
//                       Text(
//                           'Qualifying date - ${convertDateFormat(dataNextRaceDetails.qualifying!.date!)}'),
//                       Text(
//                           'Qualifying time - ${convertTimeFormat(dataNextRaceDetails.qualifying!.time!)}'),
//                       Text(
//                           'Sprint Shootout date - ${convertDateFormat(dataNextRaceDetails.secondPractice!.date!)}'),
//                       Text(
//                           'Sprint Shootout time - ${convertTimeFormat(dataNextRaceDetails.secondPractice!.time!)}'),
//                       Text(
//                           'Sprint date - ${convertDateFormat(dataNextRaceDetails.sprint!.date!)}'),
//                       Text(
//                           'Sprint time - ${convertTimeFormat(dataNextRaceDetails.sprint!.time!)}'),
//                       checkDatetime(
//                               '${dataNextRaceDetails.sprint!.date} ${dataNextRaceDetails.sprint!.time!}')
//                           ? IconButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                           SprintResult(roundNo: dataNextRaceDetails.round)
//                                     ),
//                                   );
//                               },
//                               icon: Icon(Icons.airline_seat_flat))
//                           : const SizedBox(),
//                     ],
//                   ),
//             Text('Race date - ${convertDateFormat(dataNextRaceDetails.date!)}'),
//             // Text('Race time - ${dataRaceDetails.time!}'),
//             // Text('Race date - ${DateTime.parse(dataRaceDetails.time!)}'),
//             // Text('Race date - ${DateTime.parse('${dataRaceDetails.date!} ${dataRaceDetails.time!}').toLocal()}'),
//             Text('Race time - ${convertTimeFormat(dataNextRaceDetails.time!)}'),

//             checkDatetime('${dataNextRaceDetails.date} ${dataNextRaceDetails.time!}')
//                 ? IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (BuildContext context) => RaceResult(
//                             roundNo: dataNextRaceDetails.round,
//                           ),
//                         ),
//                       );
//                     },
//                     icon: Icon(Icons.abc))
//                 : const SizedBox(),
//             checkDatetime(
//                     '${dataNextRaceDetails.qualifying!.date} ${dataNextRaceDetails.qualifying!.time!}')
//                 ? IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (BuildContext context) => QualifyingResults(
//                             roundNo: dataNextRaceDetails.round,
//                           ),
//                         ),
//                       );
//                     }, 
//                     icon: Icon(Icons.access_time_sharp))
//                 : const SizedBox(),
//             Text('Note: All times are in UTC'),
//           ],
//         ),
//       ),
//     );
//   }
// }
