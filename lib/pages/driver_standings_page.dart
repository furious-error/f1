import 'package:f1_stats/bloc/driver_standings/driver_standings_bloc.dart';
import 'package:f1_stats/bloc/driver_standings/driver_standings_event.dart';
import 'package:f1_stats/bloc/driver_standings/driver_standings_state.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:f1_stats/helper/circle_progress_indicator.dart';
import 'package:f1_stats/models/driver_standings_model.dart';
import 'package:f1_stats/pages/driver_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverStandingsPage extends StatefulWidget {
  const DriverStandingsPage({super.key});

  @override
  State<DriverStandingsPage> createState() => _DriverStandingsPageState();
}

class _DriverStandingsPageState extends State<DriverStandingsPage> {
  final DriverStandingsBloc _dsBloc = DriverStandingsBloc();

  @override
  void initState() {
    _dsBloc.add(GetDriverStandingsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  _buildDriverStandingsList(context),);
  }

  Widget _buildDriverStandingsList(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: BlocProvider(
        create: (context) => _dsBloc,
        child: BlocListener<DriverStandingsBloc, DriverStandingsState>(
          listener: (context, state) {
            if (state is DriverStandingsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<DriverStandingsBloc, DriverStandingsState>(
            builder: (context, state) {
              if (state is DriverStandingsInitial) {
                return const CircularProgressIndicatorWidget();
              } else if (state is DriverStandingsLoading) {
                return const CircularProgressIndicatorWidget();
              } else if (state is DriverStandingsLoaded) {
                return _buildDriverStandingsCard(context, state.driverStandingsModel);
              } else if (state is DriverStandingsError) {
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

  Widget _buildDriverStandingsCard(BuildContext context, DriverStandingsModel dsModel) {
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
              ),),
            // const Text('Season', style: TextStyle(
            //       fontFamily: 'Formula1',
            //       fontSize: 16,
            //     ),),
            //     const SizedBox(width: 10,),
                Text(dsModel.mRData!.standingsTable!.season!, style:const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),),
          ],
        ),
        const Text("Driver  Standings", style: TextStyle(fontFamily: 'Formula1', fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1),),),
        const SizedBox(height: 10,),
        Table(
              columnWidths: const {
                0: FlexColumnWidth(0.8),
                1: FlexColumnWidth(0.8),
                2: FlexColumnWidth(4.5),
                3: FlexColumnWidth(1.5),
              },
              // border: TableBorder.all(width:1, color:Colors.black45),
              children: const [
                TableRow(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('Pos',
                      style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),),
                    ),
            Align(
              alignment: Alignment.center,
              child: Text('No.', style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Driver',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Points',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),),
            ),
                  ]
                )
              ],
            ),
        // Row(
        //   children: const [
        //     SizedBox(width: 12,),
        //     Text('Pos',style: TextStyle(
        //                     fontFamily: 'Formula1',
        //                     fontSize: 10,
        //                     fontWeight: FontWeight.w400,
        //                   ),),
        //     SizedBox(width: 18,),
        //     Text('No.', style: TextStyle(
        //                     fontFamily: 'Formula1',
        //                     fontSize: 10,
        //                     fontWeight: FontWeight.w400,
        //                   ),),
        //     SizedBox(width: 120,),
        //     Text('Name', style: TextStyle(
        //                     fontFamily: 'Formula1',
        //                     fontSize: 10,
        //                     fontWeight: FontWeight.w400,
        //                   ),),
        //     SizedBox(width: 80,),
        //     Text('Points',style: TextStyle(
        //                     fontFamily: 'Formula1',
        //                     fontSize: 10,
        //                     fontWeight: FontWeight.w400,
        //                   ),),
        //     // SizedBox(width: 10,),
        // ],),
        Expanded(
          child: ListView.builder(
            itemCount: dsModel
                .mRData!.standingsTable!.standingsLists![0].driverStandings!.length,
            itemBuilder: (context, index) {
              var dataDriver = dsModel
                  .mRData!.standingsTable!.standingsLists![0].driverStandings![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DriverDetails(
                        driverConstructor: dataDriver.constructors![0].name!,
                        driverDOB: dataDriver.driver!.dateOfBirth!,
                        driverFamilyName: dataDriver.driver!.familyName!,
                        driverGivenName: dataDriver.driver!.givenName!,
                        driverNationality: dataDriver.driver!.nationality!,
                        driverNumber: dataDriver.driver!.permanentNumber,
                        drivercode: dataDriver.driver!.code!,
                        driverPoints: dataDriver.points!,
                        driverWins: dataDriver.wins!,
                        // driverConstructorId : dataDriver.constructors![0].constructorId!
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      columnWidths: const {
                0: FlexColumnWidth(0.6),
                1: FlexColumnWidth(0.6),
                2: FlexColumnWidth(5),
                3: FlexColumnWidth(0.8),
              },
              // border: TableBorder.all(width:1, color:Colors.black45),
                      children: [
                        TableRow(children: [
                          Text(dataDriver.position!, style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),),
                          Text(dataDriver.driver!.permanentNumber!, style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),),
                        Row(
                          children: [
                            const SizedBox(width: 8,),
                            Image.asset(logoMap[dataDriver.constructors?[0].constructorId] ?? '', height: 60, width: 40,),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                              '${dataDriver.driver!.givenName!} ${dataDriver.driver!.familyName!}', style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),),
                          ],
                        ),
                        Text(dataDriver.points!, style: const TextStyle(
                            fontFamily: 'Formula1',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),),
                        ],),
                        
                      ],
                    ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(dataDriver.position!, style: const TextStyle(
                      //       fontFamily: 'Formula1',
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w400,
                      //     ),),
                      //     const SizedBox(width: 18,),
                      //     Text(dataDriver.driver!.permanentNumber!, style: const TextStyle(
                      //       fontFamily: 'Formula1',
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400,
                      //     ),),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     Image.asset(logoMap[dataDriver.constructors![0].constructorId!]!, height: 60, width: 40,),
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text(
                      //         '${dataDriver.driver!.givenName!}  ${dataDriver.driver!.familyName!}', style: const TextStyle(
                      //       fontFamily: 'Formula1',
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500,
                      //     ),),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     Text(dataDriver.points!, style: const TextStyle(
                      //       fontFamily: 'Formula1',
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500,
                      //     ),),
                          
                      //   ],
                      // ),
                      const SizedBox(height: 10,),
                      Container(height: 0.8,color: const Color.fromRGBO(225, 6, 0, 1),)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
    } catch (e) {
      return const Scaffold(body: Center(child: Text('Some Error occurred',style: TextStyle(fontFamily: 'Formula1', fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1),),),));
    }
  }
}
