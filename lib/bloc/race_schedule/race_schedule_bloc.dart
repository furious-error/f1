import 'package:bloc/bloc.dart';
import 'package:f1_stats/bloc/race_schedule/race_schedule_event.dart';
import 'package:f1_stats/bloc/race_schedule/race_schedule_state.dart';
import 'package:f1_stats/resources/api_repository/race_schedule_api_repository.dart';

class RaceScheduleBloc extends Bloc<RaceScheduleEvent, RaceScheduleState> {
  RaceScheduleBloc() : super(RaceScheduleInitial()) {
    final RaceScheduleApiRepository _raceScheduleApiRepository =
        RaceScheduleApiRepository();

    on<GetRaceScheduleList>(
      (event, emit) async {
        try {
          emit(RaceScheduleLoading());
          final mList =
              await _raceScheduleApiRepository.fetchRaceScheduleList();
          emit(RaceScheduleLoaded(mList));
          // if(mList == null){
          //   emit(RaceScheduleError('Error Occured'));
          // }
        } on NetworkErrorRaceSchedule {
          emit(const RaceScheduleError('Something went wrong'));
        }
      },
    );
  }
}
