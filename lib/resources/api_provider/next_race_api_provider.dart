import 'package:dio/dio.dart';
import 'package:f1_stats/models/next_race_model.dart';

class NextRaceApiProvider {
  final _dio = Dio();
  final String _nextRaceUrl = 'http://ergast.com/api/f1/current/next.json';

  Future<NextRaceModel> fetchNextRace() async {
    try {
      Response response = await _dio.get(_nextRaceUrl);
      return NextRaceModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error  stacktrace: $stacktrace');
      throw Exception('Exception occured: $error  stacktrace: $stacktrace');
    }
  }
}
