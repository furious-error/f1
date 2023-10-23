import 'package:cached_network_image/cached_network_image.dart';
import 'package:f1_stats/bloc/constructor_standings/constructor_standings_bloc.dart';
import 'package:f1_stats/bloc/constructor_standings/constructor_standings_event.dart';
import 'package:f1_stats/bloc/constructor_standings/constructor_standings_state.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:f1_stats/helper/circle_progress_indicator.dart';
import 'package:f1_stats/models/constructor_standings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConstructorStandingsPage extends StatefulWidget {
  const ConstructorStandingsPage({super.key});

  @override
  State<ConstructorStandingsPage> createState() =>
      _ConstructorStandingsPageState();
}

class _ConstructorStandingsPageState extends State<ConstructorStandingsPage> {
  final ConstructorStandingsBloc _csBloc = ConstructorStandingsBloc();

  @override
  void initState() {
    _csBloc.add(GetConstructorStandingsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // appBar: AppBar(
      //   title: const Text('Constructor Standings'),
      // ),
      child: _buildConstructorStandingsList(context),
    );
  }

  Widget _buildConstructorStandingsList(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: BlocProvider(
        create: (context) => _csBloc,
        child:
            BlocListener<ConstructorStandingsBloc, ConstructorStandingsState>(
          listener: (context, state) {
            if (state is ConstructorStandingsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child:
              BlocBuilder<ConstructorStandingsBloc, ConstructorStandingsState>(
            builder: (context, state) {
              if (state is ConstructorStandingsInitial) {
                return const CircularProgressIndicatorWidget();
              } else if (state is ConstructorStandingsLoading) {
                return const CircularProgressIndicatorWidget();
              } else if (state is ConstructorStandingsLoaded) {
                return _buildConstructorStandingsCard(
                    context, state.constructorStandingsModel);
              } else if (state is ConstructorStandingsError) {
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

  Widget _buildConstructorStandingsCard(BuildContext context, ConstructorStandingsModel csModel) {
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
                Text(csModel.mRData!.standingsTable!.season!, style:const TextStyle(
                  fontFamily: 'Formula1',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),),
          ],
        ),
        const Text("Constructor  Standings", style: TextStyle(fontFamily: 'Formula1', fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1),),),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: csModel.mRData!.standingsTable!.standingsLists![0].constructorStandings!.length,
            itemBuilder: (context, index) {
              var dataConstructor = csModel.mRData!.standingsTable!.standingsLists![0].constructorStandings![index];
              return Container(
                height: MediaQuery.of(context).size.height*0.165,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  // color: teamColorsMap[dataConstructor.constructor!.constructorId!]!,
                  border: Border.all(
                    color: teamColorsMap[dataConstructor.constructor!.constructorId!]!,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CachedNetworkImage(imageUrl:teamLogoMap[dataConstructor.constructor!.constructorId!]!,
                    height: MediaQuery.of(context).size.height*0.12,
                    width: MediaQuery.of(context).size.height*0.12,
                    // fit: BoxFit.fitHeight,
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dataConstructor.constructor!.name!, style: TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: teamColorsMap[dataConstructor.constructor!.constructorId!]!,
                        ),),
                        const SizedBox(height: 10,),
                        Text('Points: ${dataConstructor.points!}', style: const TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text('Wins: ${dataConstructor.wins!}', style: const TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text('Nationality: ${dataConstructor.constructor!.nationality!}', style: const TextStyle(
                          fontFamily: 'Formula1',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      ],
                    )
                    
                  ],
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
