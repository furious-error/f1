import 'package:dio/dio.dart';
import 'package:f1_stats/models/qualifying_results_model.dart';

class QualifyingResultApiProvider{
  final _dio = Dio();

  Future<QualifyingResultModel?> fetchQualifyingResultList(String? x) async{
    final String _qualifyingResultUrl = 'http://ergast.com/api/f1/current/$x/qualifying.json';
    try{
      Response response = await _dio.get(_qualifyingResultUrl);
      return QualifyingResultModel.fromJson(response.data);
    } catch(error, stacktrace){
      print('Exception occured: $error  stacktrace: $stacktrace');
      // return null;
      // throw Exception('Null');
    }
    return null;
  }
}