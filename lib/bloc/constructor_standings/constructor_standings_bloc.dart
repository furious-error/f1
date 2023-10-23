import 'package:f1_stats/bloc/constructor_standings/constructor_standings_event.dart';
import 'package:bloc/bloc.dart';
import 'package:f1_stats/bloc/constructor_standings/constructor_standings_state.dart';
import 'package:f1_stats/resources/api_repository/constructor_standings_api_repository.dart';

class ConstructorStandingsBloc
    extends Bloc<ConstructorStandingsEvent, ConstructorStandingsState> {
  ConstructorStandingsBloc() : super(ConstructorStandingsInitial()) {
    final ConstructorStandingsApiRepository _constructorStandingsApiRepository =
        ConstructorStandingsApiRepository();

    on<GetConstructorStandingsList>(
      (event, emit) async {
        try {
          emit(ConstructorStandingsLoading());
          final mList = await _constructorStandingsApiRepository.fetchConstructorStandingsList();
          emit(ConstructorStandingsLoaded(mList));
          // if (mList == null) {
          //   emit(DriverStandingsError('Error Occured'));
          // }
        } on NetworkErrorConstructorStandings {
          emit(const ConstructorStandingsError('Something went wrong'));
        }
      },
    );
  }
}