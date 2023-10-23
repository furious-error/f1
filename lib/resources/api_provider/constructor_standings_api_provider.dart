import 'package:dio/dio.dart';
import 'package:f1_stats/models/constructor_standings_model.dart';

class ConstructorStandingsApiProvider{
  final _dio = Dio();
  final String _constructorStandingUrl = 'http://ergast.com/api/f1/current/constructorStandings.json';

  Future<ConstructorStandingsModel> fetchConstructorStandingsList() async{
    try{
      Response response = await _dio.get(_constructorStandingUrl);
      return ConstructorStandingsModel.fromJson(response.data);
    } catch(error, stacktrace){
      print('Exception occured: $error  stacktrace: $stacktrace');
      throw Exception('Exception occured: $error  stacktrace: $stacktrace');
    }
  }
}