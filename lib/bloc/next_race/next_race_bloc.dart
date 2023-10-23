import 'package:bloc/bloc.dart';
import 'package:f1_stats/bloc/next_race/next_race_event.dart';
import 'package:f1_stats/bloc/next_race/next_race_state.dart';
import 'package:f1_stats/resources/api_repository/next_race_api_repository.dart';

class NextRaceBloc extends Bloc<NextRaceEvent, NextRaceState> {
  NextRaceBloc() : super(NextRaceInitial()) {
    final NextRaceApiRepository _nextRaceApiRepository =
        NextRaceApiRepository();

    on<GetNextRace>(
      (event, emit) async {
        try {
          emit(NextRaceLoading());
          final mList = await _nextRaceApiRepository.fetchNextRace();
          emit(NextRaceLoaded(mList));
          // if (mList == null) {
          //   emit(NextRaceError('Error Occured'));
          // }
        } on NetworkErrorNextRace {
          emit(const NextRaceError('Something went wrong'));
        }
      },
    );
  }
}
