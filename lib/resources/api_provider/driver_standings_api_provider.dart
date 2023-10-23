import 'package:dio/dio.dart';
import 'package:f1_stats/models/driver_standings_model.dart';

class DriverStandingsApiProvider{
  final _dio = Dio();
  final String _driverStandingUrl = 'http://ergast.com/api/f1/current/driverStandings.json';

  Future<DriverStandingsModel> fetchDriverStandingsList() async{
    try{
      Response response = await _dio.get(_driverStandingUrl);
      return DriverStandingsModel.fromJson(response.data);
    } catch(error, stacktrace){
      print('Exception occured: $error  stacktrace: $stacktrace');
      throw Exception('Exception occured: $error  stacktrace: $stacktrace');
    }
  }
}