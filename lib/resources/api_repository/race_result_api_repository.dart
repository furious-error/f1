import 'package:f1_stats/models/race_results_model.dart';
import 'package:f1_stats/resources/api_provider/race_result_api_provider.dart';

class RaceResultApiRepository{
  final _provider = RaceResultApiProvider();

  Future<RaceResultModel?> fetchRaceResultList(String? x){
    return _provider.fetchRaceResultList(x);
  }
}

class NetworkErrorRaceResult extends Error{}