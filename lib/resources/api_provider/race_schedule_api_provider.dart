import 'package:dio/dio.dart';
import 'package:f1_stats/models/race_schedule_model.dart';

class RaceScheduleApiProvider{
  final _dio = Dio();
  final String _raceScheduleUrl = 'http://ergast.com/api/f1/current.json';

  Future<RaceScheduleModel> fetchRaceScheduleList() async{
    try{
      Response response = await _dio.get(_raceScheduleUrl);
      return RaceScheduleModel.fromJson(response.data);
    } catch(error, stacktrace){
      print('Exception occured: $error  stacktrace: $stacktrace');
      throw Exception('Exception occured: $error  stacktrace: $stacktrace');
    }
  }
}