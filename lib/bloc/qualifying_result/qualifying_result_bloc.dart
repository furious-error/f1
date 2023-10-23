import 'package:bloc/bloc.dart';
import 'package:f1_stats/models/qualifying_results_model.dart';
import 'package:f1_stats/resources/api_repository/qualifying_results_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'qualifying_result_cubit.dart';

class QualfyingResultBloc extends Cubit<QualifyingResultState>{
  QualifyingResultApiRepository _qualifyingResultApiRepository;

  QualfyingResultBloc(this._qualifyingResultApiRepository) : super(QualifyingResultState());

  getQualifyingData(String x) async{
    emit(state.copyWith(x:x));
    final mList = await _qualifyingResultApiRepository.fetchQualifyingResultList(x);
    emit(state.copyWith(qualifyingResultModel:mList));
  }
}