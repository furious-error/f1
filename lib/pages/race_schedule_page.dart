import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f1_stats/bloc/next_race/next_race_bloc.dart';
import 'package:f1_stats/bloc/next_race/next_race_event.dart';
import 'package:f1_stats/bloc/next_race/next_race_state.dart';
import 'package:f1_stats/bloc/race_schedule/race_schedule_bloc.dart';
import 'package:f1_stats/bloc/race_schedule/race_schedule_event.dart';
import 'package:f1_stats/bloc/race_schedule/race_schedule_state.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:f1_stats/helper/check_date.dart';
import 'package:f1_stats/helper/circle_progress_indicator.dart';
import 'package:f1_stats/helper/convert_date.dart';
import 'package:f1_stats/helper/countdown_timer.dart';
import 'package:f1_stats/models/next_race_model.dart';
import 'package:f1_stats/models/race_schedule_model.dart';
import 'package:f1_stats/pages/race_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RaceSchedulePage extends StatefulWidget {
  const RaceSchedulePage({super.key});

  @override
  State<RaceSchedulePage> createState() => _RaceSchedulePageState();
}

class _RaceSchedulePageState extends State<RaceSchedulePage> {
  final RaceScheduleBloc _rsBloc = RaceScheduleBloc();
  final NextRaceBloc _nrBloc = NextRaceBloc();

  @override
  void initState() {
    _rsBloc.add(GetRaceScheduleList());
    _nrBloc.add(GetNextRace());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildNextRace(),
          // _seasonEndCard(),
          Expanded(child: _buildRaceScheduleList()),
        ],
      ),
    );
  }

  Widget _buildRaceScheduleList() {
    return Container(
      // margin: EdgeInsets.all(8),
      child: BlocProvider(
        create: (context) => _rsBloc,
        child: BlocListener<RaceScheduleBloc, RaceScheduleState>(
          listener: (context, state) {
            if (state is RaceScheduleError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<RaceScheduleBloc, RaceScheduleState>(
            builder: (context, state) {
              if (state is RaceScheduleInitial) {
                return const CircularProgressIndicatorWidget();
              } else if (state is RaceScheduleLoading) {
                return const CircularProgressIndicatorWidget();
              } else if (state is RaceScheduleLoaded) {
                return _buildRaceScheduleCard(context, state.raceScheduleModel);
              } else if (state is RaceScheduleError) {
                return Container();
              } else {
                return const CircularProgressIndicatorWidget();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRaceScheduleCard(BuildContext context, RaceScheduleModel rsModel) {
    try {
      return ListView.builder(
        itemCount: rsModel.mRData!.raceTable!.races!.length,
        itemBuilder: (context, index) {
          var dataSchedule = rsModel.mRData!.raceTable!.races!;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => RaceDetailsPage(
                    rsModel: rsModel,
                    index: index,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CachedNetworkImage(imageUrl: trackLayoutMap[dataSchedule[index].circuit!.circuitId!]!,
                  // height: 80,
                  // width: 80,
                  // ),
                  // const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ROUND ${dataSchedule[index].round!}',
                            style: const TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(225, 6, 0, 1),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          checkDatetime('${dataSchedule[index].date} ${dataSchedule[index].time}')
                              ? const Text(
                                  'COMPLETED',
                                  style: TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(225, 6, 0, 1),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${convertDateFormat1('${dataSchedule[index].firstPractice!.date}, ${dataSchedule[index].firstPractice!.time!}')} - ${convertDateFormat1('${dataSchedule[index].date!}, ${dataSchedule[index].time!}')}",
                        style: const TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      // const SizedBox(height: 5,),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        dataSchedule[index].circuit!.location!.country!,
                        style: const TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        dataSchedule[index].raceName!,
                        style: const TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  // const SizedBox(),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: trackLayoutMap[dataSchedule[index].circuit!.circuitId!]!,
                      // height: 80,
                      // width: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 30,
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      return const Center(
        child: Text(
          'Some Error occurred',
          style: TextStyle(
            fontFamily: 'Formula1',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(225, 6, 0, 1),
          ),
        ),
      );
    }
  }

  Widget _buildNextRace() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: BlocProvider(
        create: (context) => _nrBloc,
        child: BlocListener<NextRaceBloc, NextRaceState>(
          listener: (context, state) {
            if (state is NextRaceError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<NextRaceBloc, NextRaceState>(
            builder: (context, state) {
              if (state is NextRaceInitial) {
                // return const CircularProgressIndicatorWidget();
                return const SizedBox();
              } else if (state is NextRaceLoading) {
                // return const CircularProgressIndicatorWidget();
                return const SizedBox();
              } else if (state is NextRaceLoaded) {
                return _buildnextRaceCard(context, state.nextRaceModel);
              } else if (state is NextRaceError) {
                return Container();
              } else {
                return const CircularProgressIndicatorWidget();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildnextRaceCard(BuildContext context, NextRaceModel nrModel) {
    var dataNextRace = nrModel.mRData!.raceTable!.races![0];
    try {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.green,
                height: 60,
                width: 80,
                child: SvgPicture.asset(
                  F1,
                  // height: 90, width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              // const Text('Season', style: TextStyle(
              //       fontFamily: 'Formula1',
              //       fontSize: 16,
              //     ),),
              //     const SizedBox(width: 10,),
              Text(
                nrModel.mRData!.raceTable!.season!,
                style: const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          // const Text("Next Race", style: TextStyle(fontFamily: 'Formula1', fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1), ),),
          // const SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ROUND ${dataNextRace.round!} - UP NEXT',
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(225, 6, 0, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${convertDateFormat1('${dataNextRace.firstPractice!.date!}, ${dataNextRace.firstPractice!.time!}')} - ${convertDateFormat1('${dataNextRace.date!}, ${dataNextRace.time!}')}',
                          style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // const Expanded(child: SizedBox()),
                    // SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                    AutoSizeText(
                      dataNextRace.circuit!.location!.country!,
                      style: const TextStyle(
                        fontFamily: 'Formula1',
                        // fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      maxFontSize: 24,
                      minFontSize: 18,
                    ),
                    // const SizedBox(width: 40,),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                checkDatetime(
                        '${dataNextRace.firstPractice!.date} ${dataNextRace.firstPractice!.time}')
                    ? Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Race Weekend In Progress',
                              style: TextStyle(
                                fontFamily: 'Formula1',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    : CountDowntimer(
                        time:
                            '${dataNextRace.firstPractice!.date} ${dataNextRace.firstPractice!.time}'),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Race Schedule',
            style: TextStyle(
              fontFamily: 'Formula1',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(225, 6, 0, 1),
            ),
          ),
        ],
      );
    } catch (e) {
      return const Center(
        child: Text(
          'Some Error occurred',
          style: TextStyle(
            fontFamily: 'Formula1',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(225, 6, 0, 1),
          ),
        ),
      );
    }
  }

  Widget _seasonEndCard() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // color: Colors.green,
              height: 60,
              width: 80,
              child: SvgPicture.asset(
                F1,
                // height: 90, width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Race Schedule',
              style: TextStyle(
                fontFamily: 'Formula1',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(225, 6, 0, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
