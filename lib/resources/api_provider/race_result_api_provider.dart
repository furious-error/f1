import 'package:dio/dio.dart';
import 'package:f1_stats/models/race_results_model.dart';

class RaceResultApiProvider {
  final _dio = Dio();

  Future<RaceResultModel?> fetchRaceResultList(String? x) async {
    final String _raceResultUrl = 'http://ergast.com/api/f1/current/$x/results.json';
    try {
      Response response = await _dio.get(_raceResultUrl);
      // print(response.data);
      return RaceResultModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error  stacktrace: $stacktrace');
      // throw Exception('Exception occured: $error  stacktrace: $stacktrace');
    }
    return null;
  }
}
