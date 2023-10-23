import 'package:equatable/equatable.dart';
import 'package:f1_stats/models/race_schedule_model.dart';

abstract class RaceScheduleState extends Equatable{
  const RaceScheduleState();

  @override
  List<Object?> get props => [];
}

class RaceScheduleInitial extends RaceScheduleState{}

class RaceScheduleLoading extends RaceScheduleState{}

class RaceScheduleLoaded extends RaceScheduleState{
  final RaceScheduleModel raceScheduleModel;
  const RaceScheduleLoaded(this.raceScheduleModel);
}

class RaceScheduleError extends RaceScheduleState{
  final String? message;
  const RaceScheduleError(this.message);
}