import 'package:dio/dio.dart';
import 'package:f1_stats/models/sprint_results_model.dart';

class SprintResultApiProvider{
  final _dio = Dio();

  Future<SprintResultModel?> fetchSprintResultList(String? x) async{
    final String _sprintResultUrl = 'http://ergast.com/api/f1/current/$x/sprint.json';

    try{
      Response response = await _dio.get(_sprintResultUrl);
      return SprintResultModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print('Exception occured: $error  stacktrace: $stacktrace');
      // throw Exception('Exception occured: $error  stacktrace: $stacktrace');
    }
    return null;
  }
}