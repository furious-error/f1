// import 'package:cached_network_image/cached_network_image.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:f1_stats/helper/check_date.dart';
import 'package:f1_stats/helper/convert_date.dart';
import 'package:f1_stats/models/race_schedule_model.dart';
import 'package:f1_stats/pages/qualifying_results.dart';
import 'package:f1_stats/pages/race_results.dart';
import 'package:f1_stats/pages/sprint_results.dart';
import 'package:f1_stats/utilities/components/detail_card.dart';
import 'package:flutter/material.dart';

class RaceDetailsPage extends StatefulWidget {
  final RaceScheduleModel rsModel;
  final int index;
  const RaceDetailsPage({
    super.key,
    required this.rsModel,
    required this.index,
  });

  @override
  State<RaceDetailsPage> createState() => _RaceDetailsPageState();
}

class _RaceDetailsPageState extends State<RaceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var dataRaceDetails = widget.rsModel.mRData!.raceTable!.races![widget.index];
    try {
      return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          trackMap[dataRaceDetails.circuit!.circuitId!]!,
                        ),
                        fit: BoxFit.fill,
                        repeat: ImageRepeat.noRepeat,
                        // colorFilter:ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken,),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [Colors.black.withOpacity(0.3), Colors.black.withOpacity(0.7)],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dataRaceDetails.circuit!.location!.country!,
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          widget.rsModel.mRData!.raceTable!.season!,
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${convertDateFormat1('${dataRaceDetails.firstPractice!.date!}, ${dataRaceDetails.firstPractice!.time!}')} - ${convertDateFormat1('${dataRaceDetails.date!}, ${dataRaceDetails.time!}')}',
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          '${dataRaceDetails.circuit!.circuitName}',
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${dataRaceDetails.raceName!} Weekend',
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(225, 6, 0, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(dataRaceDetails.circuit!.location!.locality!),
                        DetailCard(
                          showicon: false,
                          time: convertTimeFormat(dataRaceDetails.firstPractice!.time!),
                          date: convertDateFormat1(
                              '${dataRaceDetails.firstPractice!.date!}, ${dataRaceDetails.firstPractice!.time!}'),
                          title: 'Free Practice 1',
                        ),
                        Container(
                          // width: 1,
                          height: 0.5,
                          color: const Color.fromRGBO(225, 6, 0, 1),
                        ),
                        dataRaceDetails.toJson()['Sprint'] == null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailCard(
                                    showicon: false,
                                    title: 'Free Practice 2',
                                    date: convertDateFormat1(
                                        '${dataRaceDetails.secondPractice!.date!}, ${dataRaceDetails.secondPractice!.time!}'),
                                    time: convertTimeFormat(dataRaceDetails.secondPractice!.time!),
                                  ),
                                  Container(
                                    // width: 1,
                                    height: 0.5,
                                    color: const Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                  DetailCard(
                                    showicon: false,
                                    title: 'Free Practice 3',
                                    time: convertTimeFormat(dataRaceDetails.thirdPractice!.time!),
                                    date: convertDateFormat1(
                                        '${dataRaceDetails.thirdPractice!.date!}, ${dataRaceDetails.thirdPractice!.time!}'),
                                  ),
                                  Container(
                                    // width: 1,
                                    height: 0.5,
                                    color: const Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                  DetailCard(
                                    showicon: checkDatetime(
                                        '${dataRaceDetails.qualifying!.date} ${dataRaceDetails.qualifying!.time!}'),
                                    nextPage: QualifyingResults(roundNo: dataRaceDetails.round),
                                    time: convertTimeFormat(dataRaceDetails.qualifying!.time!),
                                    date: convertDateFormat1(
                                        '${dataRaceDetails.qualifying!.date}, ${dataRaceDetails.qualifying!.time!}'),
                                    title: 'Qualifying',
                                  ),
                                  Container(
                                    // width: 1,
                                    height: 0.5,
                                    color: const Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DetailCard(
                                    showicon: false,
                                    time: convertTimeFormat(dataRaceDetails.secondPractice!.time!),
                                    date: convertDateFormat1(
                                        '${dataRaceDetails.secondPractice!.date!}, ${dataRaceDetails.secondPractice!.time!}'),
                                    title: 'Sprint Shootout',
                                  ),
                                  Container(
                                    // width: 1,
                                    height: 0.5,
                                    color: const Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                  DetailCard(
                                    showicon: checkDatetime(
                                        '${dataRaceDetails.sprint!.date} ${dataRaceDetails.sprint!.time!}'),
                                    nextPage: SprintResult(roundNo: dataRaceDetails.round),
                                    time: convertTimeFormat(dataRaceDetails.sprint!.time!),
                                    date: convertDateFormat1(
                                        '${dataRaceDetails.sprint!.date}, ${dataRaceDetails.sprint!.time!}'),
                                    title: 'Sprint',
                                  ),
                                  Container(
                                    // width: 1,
                                    height: 0.5,
                                    color: const Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                  DetailCard(
                                    showicon: checkDatetime(
                                        '${dataRaceDetails.qualifying!.date} ${dataRaceDetails.qualifying!.time!}'),
                                    nextPage: QualifyingResults(roundNo: dataRaceDetails.round),
                                    time: convertTimeFormat(dataRaceDetails.qualifying!.time!),
                                    date: convertDateFormat(
                                        '${dataRaceDetails.qualifying!.date}, ${dataRaceDetails.qualifying!.time!}'),
                                    title: 'Qualifying',
                                  ),
                                  Container(
                                    // width: 1,
                                    height: 0.5,
                                    color: const Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                ],
                              ),
                        // Text('Race date - ${convertDateFormat(dataRaceDetails.date!)}'),
                        // Text('Race time - ${dataRaceDetails.time!}'),
                        // Text('Race date - ${DateTime.parse(dataRaceDetails.time!)}'),
                        // Text('Race date - ${DateTime.parse('${dataRaceDetails.date!} ${dataRaceDetails.time!}').toLocal()}'),
                        // Text('Race time - ${convertTimeFormat(dataRaceDetails.time!)}'),
                        DetailCard(
                          showicon:
                              checkDatetime('${dataRaceDetails.date} ${dataRaceDetails.time!}'),
                          nextPage: RaceResult(roundNo: dataRaceDetails.round),
                          title: 'Race',
                          date: convertDateFormat1(
                              '${dataRaceDetails.date!}, ${dataRaceDetails.time!}'),
                          time: convertTimeFormat(dataRaceDetails.time!),
                        ),

                        const Text(
                          'Note: Times Dispalyed are Local Time',
                          style: TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      print(e);
      return const Scaffold(
        body: Center(
          child: Text(
            'Some Error occurred',
            style: TextStyle(
              fontFamily: 'Formula1',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(225, 6, 0, 1),
            ),
          ),
        ),
      );
    }
  }
}
