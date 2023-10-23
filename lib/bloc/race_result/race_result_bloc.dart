// import 'package:bloc/bloc.dart';
// import 'package:f1_stats/bloc/race_result/race_result_event.dart';
// import 'package:f1_stats/bloc/race_result/race_result_state.dart';
// import 'package:f1_stats/resources/api_repository/race_result_api_repository.dart';

// class RaceResultBloc extends Bloc<RaceResultEvent, RaceResultState>{
//   // String? x;
//   RaceResultBloc():super(RaceResultInitial()){
//     final RaceResultApiRepository _raceResultApiRepository = RaceResultApiRepository();
//     String? x;
//     on<GetRaceResultList>((event, emit) async{
//       try {
//         emit(RaceResultRoundNo(x));
//         emit(RaceResultLoading());
//         final mList = await _raceResultApiRepository.fetchRaceResultList(x);
//         emit(RaceResultLoaded(mList));
//         // if(mList == null){
//         //   emit(RaceResultError('Error Occured'));
//         // }
//       } on NetworkErrorRaceResult{
//         emit(const RaceResultError('Something went wrong'));
//       }
//     },);
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:f1_stats/models/race_results_model.dart';
import 'package:f1_stats/resources/api_repository/race_result_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'race_result_cubit.dart';

class RaceResultBloc extends Cubit<RaceResultsState> {
  RaceResultApiRepository _raceResultApiRepository;

  RaceResultBloc(this._raceResultApiRepository) : super(RaceResultsState());

  getRaceData(String x) async {
    emit(state.copyWith(x: x));
    final mList = await _raceResultApiRepository.fetchRaceResultList(x);
    emit(state.copyWith(raceResultModel: mList));
  }
}
