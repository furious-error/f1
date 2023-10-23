import 'package:f1_stats/models/driver_standings_model.dart';
import 'package:f1_stats/resources/api_provider/driver_standings_api_provider.dart';

class DriverStandingsApiRepository{
  final _provider = DriverStandingsApiProvider();

  Future<DriverStandingsModel> fetchDriverStandingsList(){
    return _provider.fetchDriverStandingsList();
  }
}

class NetworkErrorDriverStandings extends Error{}
