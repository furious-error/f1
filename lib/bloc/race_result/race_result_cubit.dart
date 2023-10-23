part of 'race_result_bloc.dart';

class RaceResultsState extends Equatable {
  final String? x;
  final RaceResultModel? raceResultModel;

  const RaceResultsState({this.x, this.raceResultModel});

  RaceResultsState copyWith({
    String? x,
    RaceResultModel? raceResultModel,
  }) {
    return RaceResultsState(
      x: x ?? this.x,
      raceResultModel: raceResultModel ?? this.raceResultModel,
    );
  }

  @override
  List<Object?> get props => [
        x,
        raceResultModel,
      ];
}
