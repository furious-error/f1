import 'package:f1_stats/models/sprint_results_model.dart';
import 'package:f1_stats/resources/api_provider/sprint_result_api_provider.dart';

class SprintResultApiRepository{
  final _provider = SprintResultApiProvider();

  Future<SprintResultModel?> fetchSprintResultList(String? x){
    return _provider.fetchSprintResultList(x);
  }
}

class NetworkErrorSprintResult extends Error{}