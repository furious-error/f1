part of 'qualifying_result_bloc.dart';

class QualifyingResultState extends Equatable {
  final String? x;
  final QualifyingResultModel? qualifyingResultModel;

  const QualifyingResultState({this.x, this.qualifyingResultModel});

  QualifyingResultState copyWith({
    String? x,
    QualifyingResultModel? qualifyingResultModel,
  }) {
    return QualifyingResultState(
        x: x ?? this.x,
        qualifyingResultModel:qualifyingResultModel ?? this.qualifyingResultModel);
  }

  @override
  List<Object?> get props => [
        x,
        qualifyingResultModel,
      ];
}
