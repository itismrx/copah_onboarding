import 'package:bloc/bloc.dart';
import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

part 'temp_unit_state.dart';

class TempUnitCubit extends Cubit<TempUnitState> {
  TempUnitCubit() : super(const TempUnitCurrentState());

  void toggleUnit(TempUnit unit) {
    emit(TempUnitCurrentState(
        tempUnit:
            unit == TempUnit.imperial ? TempUnit.metric : TempUnit.imperial));
  }
}
