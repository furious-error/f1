import 'package:f1_stats/bloc/qualifying_result/qualifying_result_bloc.dart';
import 'package:f1_stats/constants/team_logos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QualifyingResults extends StatefulWidget {
  
  final String? roundNo;
  const QualifyingResults({super.key, required this.roundNo});

  @override
  State<QualifyingResults> createState() => _QualifyingResultsState();
}

class _QualifyingResultsState extends State<QualifyingResults> {
  @override
  void initState() {
    context.read<QualfyingResultBloc>().getQualifyingData(widget.roundNo ?? "0");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // appBar: AppBar(
      //   title: Text('Qualifying Result'),
      // ),
      child: Scaffold(
        body: _buildQualifyingResultList(context),
      ),
    );
  }
  Widget _buildQualifyingResultList(BuildContext context){
    return Container(
      // height: 500,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: BlocConsumer<QualfyingResultBloc, QualifyingResultState>(
        listener: (context, state) {},
        builder: (context, state) {
        try {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${state.qualifyingResultModel?.mRData?.raceTable?.races?[0].raceName} Qualifying', style: const TextStyle(fontFamily: 'Formula1', fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500,),),
            const SizedBox(height: 20,),
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
              child: Text('Driver', style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Q1',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Q2',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Q3',style: TextStyle(
                              fontFamily: 'Formula1',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
            ),
                  ]
                )
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: state.qualifyingResultModel?.mRData?.raceTable?.races?[0].qualifyingResults?.length,
                  itemBuilder: (context, index){
                    var dataQualifyingResult = state.qualifyingResultModel?.mRData?.raceTable?.races?[0].qualifyingResults?[index];
                    
                    return Column(
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
                                child: Text(dataQualifyingResult?.position ?? "", 
                                style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),),
                              ),
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Container(width: 4, height: 20, color: teamColorsMap[dataQualifyingResult?.constructor?.constructorId],),
                                  const SizedBox(width: 5,),
                                  Text(dataQualifyingResult?.driver?.code ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),
                            ),
                            
                            Align(
                              alignment: Alignment.center,
                              child: Text(dataQualifyingResult?.q1 ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(dataQualifyingResult?.q2 ?? "", style: const TextStyle(
                                    fontFamily: 'Formula1',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(dataQualifyingResult?.q3 ?? "", style: const TextStyle(
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
                        const SizedBox(height: 10,),
                      ],
                    );
                  },),
              ),
            ),
          ],
        );
        } catch (e) {
          // print(e);
          return const Center(child: Text('Results Coming Soon',style: TextStyle(fontFamily: 'Formula1', fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(225, 6, 0, 1),),),);
        }
      },),
    );
  }
}