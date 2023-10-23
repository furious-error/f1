import 'package:equatable/equatable.dart';
import 'package:f1_stats/models/constructor_standings_model.dart';

abstract class ConstructorStandingsState extends Equatable{
  const ConstructorStandingsState();

  @override
  List<Object?> get props => [];
}

class ConstructorStandingsInitial extends ConstructorStandingsState{}

class ConstructorStandingsLoading extends ConstructorStandingsState{}

class ConstructorStandingsLoaded extends ConstructorStandingsState{
  final ConstructorStandingsModel constructorStandingsModel;
  const ConstructorStandingsLoaded(this.constructorStandingsModel);
}

class ConstructorStandingsError extends ConstructorStandingsState{
  final String? message;
  const ConstructorStandingsError(this.message);
}