import 'package:equatable/equatable.dart';
import 'package:f1_stats/models/next_race_model.dart';

abstract class NextRaceState extends Equatable{
  const NextRaceState();

  @override
  List<Object?> get props => [];
}

class NextRaceInitial extends NextRaceState{}

class NextRaceLoading extends NextRaceState{}

class NextRaceLoaded extends NextRaceState{
  final NextRaceModel nextRaceModel;
  const NextRaceLoaded(this.nextRaceModel);
}

class NextRaceError extends NextRaceState{
  final String? message;
  const NextRaceError(this.message);
}