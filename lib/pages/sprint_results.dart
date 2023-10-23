import 'package:f1_stats/bloc/sprint_result/sprint_result_bloc.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:f1_stats/helper/top3_card.dart';
import 'package:f1_stats/pages/sprint_result_driver_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SprintResult extends StatefulWidget {
  final String? roundNo;
  const SprintResult({super.key, required this.roundNo});

  @override
  State<SprintResult> createState() => _SprintResultState();
}

class _SprintResultState extends State<SprintResult> {
  @override
  void initState() {
    context.read<SprintResultBloc>().getSprintData(widget.roundNo ?? "0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Sprint Result'),
        // ),
        body: _buildSprintResultList(context),
      ),
    );
  }

  Widget _buildSprintResultList(BuildContext context) {
    return Container(
      // height: 500,
      margin: EdgeInsets.all(8),
      child: BlocConsumer<SprintResultBloc, SprintResultState>(
        listener: (context, state) {},
        builder: (context, state) {
          try {
            return Column(
                children: [
                  Text('${state.sprintResultModel?.mRData?.raceTable?.races?[0].raceName} Sprint', style: const TextStyle(fontFamily: 'Formula1', fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500,),),
            const SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     TopDriverCard(
            //       driverPhoto: driverMap[state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[1].driver?.code],
            //       teamColor: teamColorsMap[state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[1].constructor!.constructorId]!, 
            //       driverCode: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[1].driver?.code, time: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[1].time?.time, points: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[1].points, position: '${state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[1].position}nd', height: 150,),
            //     TopDriverCard(
            //       driverPhoto: driverMap[state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[0].driver?.code],
            //       teamColor: teamColorsMap[state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[0].constructor!.constructorId]!, 
            //       driverCode: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[0].driver?.code, time: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[0].time?.time, points: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[0].points, position: '${state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[0].position}st', height: 180,),
            //     TopDriverCard(
            //       driverPhoto: driverMap[state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[2].driver?.code],
            //       teamColor: teamColorsMap[state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[2].constructor!.constructorId]!, 
            //       driverCode: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[2].driver?.code, time: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[2].time?.time, points: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[2].points, position: '${state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[2].position}rd', height: 120,),
            //   ],
            // ),
            const SizedBox(height: 10,),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(4),
                3: FlexColumnWidth(4),
                4: FlexColumnWidth(4),
              },
              // border: TableBorder.all(width:1, color:Colors.black45),
              children: const [
                TableRow(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('Pos',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
                    ),
            Align(
              alignment: Alignment.center,
              child: Text('No.', style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Driver',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Time',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Points',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?.length,
                        itemBuilder: (context, index) {
                          var dataSprintResult =
                    state.sprintResultModel?.mRData?.raceTable?.races?[0].sprintResults?[index];
                    // if(index < 3){
                    //   return const SizedBox(height: 0,);
                    // }
                    
                      return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SprintResultDriverDetails(
                                        givenName: dataSprintResult?.driver?.givenName,
                                        familyName: dataSprintResult?.driver?.familyName,
                                        code: dataSprintResult?.driver?.code,
                                        number: dataSprintResult?.number,
                                        points: dataSprintResult?.points,
                                        constructorName: dataSprintResult?.constructor?.name,
                                        startingGrid: dataSprintResult?.grid,
                                        lapsCompleted: dataSprintResult?.laps,
                                        fastestLaptime: dataSprintResult?.fastestLap?.time?.time,
                                      ),
                                ),
                              );
                            },
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     Text(dataSprintResult?.positionText ?? ""),
                            //     const SizedBox(width: 10,),
                            //     Text(dataSprintResult?.number ??""),
                            //     const SizedBox(width: 10,),
                            //     Text(dataSprintResult?.driver?.code ??""),
                            //     const SizedBox(width: 10,),
                            //     Text(dataSprintResult?.time?.time ?? "DNF"),
                            //     const SizedBox(width: 10,),
                            //     Text(dataSprintResult?.points ?? ""),
                            //   ],
                            // ),
                            child: Column(
                              children: [
                    const SizedBox(height: 10,),
                    Table(
                      columnWidths: const {
                0: FlexColumnWidth(1.8),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(4),
                3: FlexColumnWidth(4),
                4: FlexColumnWidth(4),
              },
              // border: TableBorder.all(width:1, color:Colors.black45),
                      children: [
                        TableRow(children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(dataSprintResult?.position ?? "", 
                            style: const TextStyle(
                                fontFamily: 'Formula1',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),),
                          ),
                        
                        
                        Align(
                          alignment: Alignment.center,
                          child: Text(dataSprintResult?.number ?? "", style: const TextStyle(
                                fontFamily: 'Formula1',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(width: 4, height: 20, color: teamColorsMap[dataSprintResult?.constructor?.constructorId],),
                              const SizedBox(width: 5,),
                              Text(dataSprintResult?.driver?.code ?? "", style: const TextStyle(
                                fontFamily: 'Formula1',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          // child: (dataRaceResult?.status == 'Finished')? Text(dataRaceResult?.time?.time ?? "", style: const TextStyle(
                          //       fontFamily: 'Formula1',
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w400,
                          //     ),) : ((dataRaceResult?.status == '+1 Lap')?Text(dataRaceResult?.status ?? "", style: const TextStyle(
                          //       fontFamily: 'Formula1',
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w400,
                          //     ),):const Text('DNF', style: TextStyle(
                          //       fontFamily: 'Formula1',
                          //       fontSize: 13,
                          //       fontWeight: FontWeight.w400,
                          //     ),)),
                          child: Text(dataSprintResult?.time?.time ?? "DNF", style: const TextStyle(
                                fontFamily: 'Formula1',
                                fontSize: 13,
                                fontWeight: FontWeight.w400,),
                          
                        ),),
                        Align(
                          alignment: Alignment.center,
                          child: Text(dataSprintResult?.points ?? "", style: const TextStyle(
                                fontFamily: 'Formula1',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),),
                        ),
                        
                        ],),
                        
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      color: const Color.fromRGBO(225, 6, 0, 1,),
                      height: 0.7,
                    ),
                    const SizedBox(height: 10,),],
                            ),
                          );
                    
                        },),
                  ),
                ],
              );
          } catch (e) {
            return const Center(child: Text('Results Coming Soon',style: TextStyle(fontFamily: 'Formula1', fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1),),),);
          }
        },
      ),
    );
  }
}
