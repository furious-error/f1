import 'package:f1_stats/models/race_schedule_model.dart';
import 'package:f1_stats/resources/api_provider/race_schedule_api_provider.dart';

class RaceScheduleApiRepository{
  final _provider = RaceScheduleApiProvider();

  Future<RaceScheduleModel> fetchRaceScheduleList(){
    return _provider.fetchRaceScheduleList();
  }
}

class NetworkErrorRaceSchedule extends Error{}