import 'package:f1_stats/bloc/race_result/race_result_bloc.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:f1_stats/helper/top3_card.dart';
import 'package:f1_stats/pages/race_result_driver_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaceResult extends StatefulWidget {
  final String? roundNo;
  const RaceResult({super.key, required this.roundNo});

  @override
  State<RaceResult> createState() => _RaceResultState();
}

class _RaceResultState extends State<RaceResult> {
  @override
  void initState() {
    context.read<RaceResultBloc>().getRaceData(widget.roundNo ?? "0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Race Result'),
        // ),
        body: _buildRaceResultList(context),
      ),
    );
  }

  Widget _buildRaceResultList(BuildContext context) {
    return Container(
      // height: 500,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: BlocConsumer<RaceResultBloc, RaceResultsState>(
        listener: (context, state) {},
        builder: (context, state) {
          try {
            return Column(
                children: [
                  Text('${state.raceResultModel?.mRData?.raceTable?.races?[0].raceName}', style: const TextStyle(fontFamily: 'Formula1', fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500,),),
            const SizedBox(height: 10,),
            // Column(
            //   children: [
            //     TopDriverCard(
            //       driverPhoto: driverMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[1].driver?.code],
            //       teamColor: teamColorsMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[1].constructor!.constructorId]!, 
            //       driverCode: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[1].driver?.code, time: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[1].time?.time, points: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[1].points, position: '${state.raceResultModel?.mRData?.raceTable?.races?[0].results?[1].position}nd', height: 150,),
            //     TopDriverCard(
            //       driverPhoto: driverMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].driver?.code],
            //       teamColor: teamColorsMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].constructor!.constructorId]!, 
            //       driverCode: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].driver?.code, time: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].time?.time, points: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].points, position: '${state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].position}st', height: 180,),
            //     TopDriverCard(
            //       driverPhoto: driverMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[2].driver?.code],
            //       teamColor: teamColorsMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[2].constructor!.constructorId]!, 
            //       driverCode: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[2].driver?.code, time: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[2].time?.time, points: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[2].points, position: '${state.raceResultModel?.mRData?.raceTable?.races?[0].results?[2].position}rd', height: 120,),
            //   ],
            // ),
            const SizedBox(height: 10,),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
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
                    child: Container(
                        child: ListView.builder(
                            itemCount: state.raceResultModel?.mRData?.raceTable?.races?[0].results?.length,
                            itemBuilder: (context, index) {
                              var dataRaceResult =
                    state.raceResultModel?.mRData?.raceTable?.races?[0].results?[index];
                  //   if(index < 3){
                  //     return TopDriverCard(
                  // driverPhoto: driverMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[index].driver?.code],
                  // teamColor: teamColorsMap[state.raceResultModel?.mRData?.raceTable?.races?[0].results?[index].constructor!.constructorId]!, 
                  // driverCode: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[0].driver?.code, 
                  // time: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[index].time?.time, 
                  // points: state.raceResultModel?.mRData?.raceTable?.races?[0].results?[index].points, 
                  // position: '${state.raceResultModel?.mRData?.raceTable?.races?[0].results?[index].position}', height: 180,);
                  //   }
                              
                      return GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (BuildContext context) =>
                                //           RaceResultDriverDetails(
                                //             givenName: dataRaceResult?.driver?.givenName,
                                //             familyName: dataRaceResult?.driver?.familyName,
                                //             code: dataRaceResult?.driver?.code,
                                //             number: dataRaceResult?.number,
                                //             points: dataRaceResult?.points,
                                //             constructorName: dataRaceResult?.constructor?.name,
                                //             startingGrid: dataRaceResult?.grid,
                                //             lapsCompleted: dataRaceResult?.laps,
                                //             fastestLaptime: dataRaceResult?.fastestLap?.time?.time,
                                //             fastestLapRank: dataRaceResult?.fastestLap?.rank,
                                //           ),
                                //     ),
                                //   );
                                // },
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
                                child: Text(dataRaceResult?.position ?? "", 
                                style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),),
                              ),
                            
                            
                            Align(
                              alignment: Alignment.center,
                              child: Text(dataRaceResult?.number ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Container(width: 4, height: 20, color: teamColorsMap[dataRaceResult?.constructor?.constructorId],),
                                  const SizedBox(width: 5,),
                                  Text(dataRaceResult?.driver?.code ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: (dataRaceResult?.status == 'Finished')? Text(dataRaceResult?.time?.time ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),) : ((dataRaceResult?.status == '+1 Lap')?Text(dataRaceResult?.status ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),):const Text('DNF', style: TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),)),
                              
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(dataRaceResult?.points ?? "", style: const TextStyle(
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
