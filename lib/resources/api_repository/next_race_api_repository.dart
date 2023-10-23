import 'package:f1_stats/models/next_race_model.dart';
import 'package:f1_stats/resources/api_provider/next_race_api_provider.dart';

class NextRaceApiRepository{
  final _provider = NextRaceApiProvider();

  Future<NextRaceModel> fetchNextRace(){
    return _provider.fetchNextRace();
  }
}

class NetworkErrorNextRace extends Error{}