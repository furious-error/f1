import 'package:f1_stats/models/qualifying_results_model.dart';
import 'package:f1_stats/resources/api_provider/qualifying_results_api_provider.dart';

class QualifyingResultApiRepository{
  final _provider = QualifyingResultApiProvider();

  Future<QualifyingResultModel?> fetchQualifyingResultList(String? x){
    return _provider.fetchQualifyingResultList(x);
  }
}

class NetworkErrorQualifyingResult extends Error{}