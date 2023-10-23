part of 'sprint_result_bloc.dart';

class SprintResultState extends Equatable{
  final String? x;
  final SprintResultModel? sprintResultModel;

  const SprintResultState({this.x, this.sprintResultModel});

  SprintResultState copyWith({
    String? x,
    SprintResultModel? sprintResultModel,
  }){
    return SprintResultState(
      x: x ?? this.x,
      sprintResultModel: sprintResultModel ?? this.sprintResultModel,
    );
  }

  @override
  List<Object?> get props => [
    x, 
    sprintResultModel,
  ];
}