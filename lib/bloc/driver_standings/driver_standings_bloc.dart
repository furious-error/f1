import 'package:bloc/bloc.dart';
import 'package:f1_stats/bloc/driver_standings/driver_standings_event.dart';
import 'package:f1_stats/bloc/driver_standings/driver_standings_state.dart';
import 'package:f1_stats/resources/api_repository/driver_standings_api_repository.dart';

class DriverStandingsBloc
    extends Bloc<DriverStandingsEvent, DriverStandingsState> {
  DriverStandingsBloc() : super(DriverStandingsInitial()) {
    final DriverStandingsApiRepository _driverStandingsApiRepository =
        DriverStandingsApiRepository();

    on<GetDriverStandingsList>(
      (event, emit) async {
        try {
          emit(DriverStandingsLoading());
          final mList = await _driverStandingsApiRepository.fetchDriverStandingsList();
          emit(DriverStandingsLoaded(mList));
          // if (mList == null) {
          //   emit(DriverStandingsError('Error Occured'));
          // }
        } on NetworkErrorDriverStandings {
          emit(const DriverStandingsError('Something went wrong'));
        }
      },
    );
  }
}
