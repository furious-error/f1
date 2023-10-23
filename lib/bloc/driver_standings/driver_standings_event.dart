import 'package:equatable/equatable.dart';

abstract class DriverStandingsEvent extends Equatable{
  const DriverStandingsEvent();

  @override
  List<Object> get props => [];
}

class GetDriverStandingsList extends DriverStandingsEvent{}