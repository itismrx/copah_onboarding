part of 'temp_unit_cubit.dart';

sealed class TempUnitState extends Equatable {
  const TempUnitState();

  @override
  List<Object> get props => [];
}

final class TempUnitCurrentState extends TempUnitState {
  final TempUnit tempUnit;
  const TempUnitCurrentState({this.tempUnit = TempUnit.metric});

  @override
  List<Object> get props => [tempUnit];
}
