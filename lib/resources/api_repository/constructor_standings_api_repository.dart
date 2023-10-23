import 'package:f1_stats/models/constructor_standings_model.dart';
import 'package:f1_stats/resources/api_provider/constructor_standings_api_provider.dart';

class ConstructorStandingsApiRepository{
  final _provider = ConstructorStandingsApiProvider();

  Future<ConstructorStandingsModel> fetchConstructorStandingsList(){
    return _provider.fetchConstructorStandingsList();
  }
}

class NetworkErrorConstructorStandings extends Error{}