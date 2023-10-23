import 'package:equatable/equatable.dart';

abstract class RaceScheduleEvent extends Equatable{
  const RaceScheduleEvent();

  @override
  List<Object> get props => [];
}

class GetRaceScheduleList extends RaceScheduleEvent{}