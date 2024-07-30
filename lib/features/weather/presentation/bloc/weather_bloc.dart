import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/domain/usecases/get_current_weather.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  WeatherBloc(this.getCurrentWeatherUseCase) : super(WeatherInitial()) {
    on<OnGeoLocationChanged>((event, emit) async {
      emit(WeatherLoading());
      final result =
          await getCurrentWeatherUseCase.execute(event.lat, event.lng);

      result.fold(
        (failure) {
          emit(WeatherError(failure.message));
        },
        (data) {
          emit(WeatherSuccess(data));
        },
      );
    });
  }
}
