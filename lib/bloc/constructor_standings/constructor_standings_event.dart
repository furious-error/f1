import 'package:equatable/equatable.dart';

abstract class ConstructorStandingsEvent extends Equatable{
  const ConstructorStandingsEvent();

  @override
  List<Object> get props => [];
}

class GetConstructorStandingsList extends ConstructorStandingsEvent{}