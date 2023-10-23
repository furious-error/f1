import 'package:equatable/equatable.dart';
import 'package:f1_stats/models/sprint_results_model.dart';
import 'package:f1_stats/resources/api_repository/sprint_result_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sprint_result_cubit.dart';

class SprintResultBloc extends Cubit<SprintResultState>{
  SprintResultApiRepository _sprintResultApiRepository;

  SprintResultBloc(this._sprintResultApiRepository) : super(SprintResultState());

  getSprintData(String x) async{
    emit(state.copyWith(x:x));
    final mList = await _sprintResultApiRepository.fetchSprintResultList(x);
    emit(state.copyWith(sprintResultModel : mList));
  }
  
}