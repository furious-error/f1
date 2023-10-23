import 'package:equatable/equatable.dart';

abstract class NextRaceEvent extends Equatable{
  const NextRaceEvent();

  @override
  List<Object> get props => [];
}

class GetNextRace extends NextRaceEvent{}