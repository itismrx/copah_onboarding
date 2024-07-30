import 'package:bloc_test/bloc_test.dart';
import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/core/errors/failure.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();
    weatherBloc = WeatherBloc(mockGetCurrentWeatherUseCase);
  });

  const weatherEntity =
      WeatherEntity(cityName: "London", temperature: 23.92, iconCode: "01d");
  const String lat = "51.51494225418024", lng = "-0.12363193061883422";
  const TempUnit unit = TempUnit.metric;

  test("should get inital state", () {
    expect(
      weatherBloc.state,
      WeatherInitial(),
    );
  });

  blocTest<WeatherBloc, WeatherState>(
    'emits [WeatherLoading, WeatherSuccess] when WeatherDataFetch is added.',
    build: () {
      when(mockGetCurrentWeatherUseCase.execute(lat, lng, unit))
          .thenAnswer((_) async => const Right(weatherEntity));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const WeatherDataFetch(lat: lat, lng: lng)),
    expect: () => [WeatherLoading(), const WeatherSuccess(weatherEntity)],
  );

  blocTest<WeatherBloc, WeatherState>(
    'emits [WeatherLoading, WeatherError] when we get error returned.',
    build: () {
      when(mockGetCurrentWeatherUseCase.execute(lat, lng, unit)).thenAnswer(
          (_) async => const Left(ServerFailure("Unable to get response")));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const WeatherDataFetch(lat: lat, lng: lng)),
    expect: () =>
        [WeatherLoading(), const WeatherError("Unable to get response")],
  );
}
