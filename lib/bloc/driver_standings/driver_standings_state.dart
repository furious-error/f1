import 'package:equatable/equatable.dart';
import 'package:f1_stats/models/driver_standings_model.dart';

abstract class DriverStandingsState extends Equatable{
  const DriverStandingsState();

  @override
  List<Object?> get props => [];
}

class DriverStandingsInitial extends DriverStandingsState{}

class DriverStandingsLoading extends DriverStandingsState{}

class DriverStandingsLoaded extends DriverStandingsState{
  final DriverStandingsModel driverStandingsModel;
  const DriverStandingsLoaded(this.driverStandingsModel);
}

class DriverStandingsError extends DriverStandingsState{
  final String? message;
  const DriverStandingsError(this.message);
}