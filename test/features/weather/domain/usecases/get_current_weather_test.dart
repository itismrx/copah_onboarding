import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/domain/usecases/get_current_weather.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail =
      WeatherEntity(cityName: "London", temperature: 23.92, iconCode: "01d");

  const String lat = "51.51494225418024", lng = "-0.12363193061883422";
  const TempUnit unit = TempUnit.metric;

  test(
    "fetch weather data from the repo",
    () async {
      // arrange
      when(mockWeatherRepository.getCurrentWeather(lat, lng, unit)).thenAnswer(
        (_) async => const Right(testWeatherDetail),
      );
      // act

      final result = await getCurrentWeatherUseCase.execute(lat, lng, unit);
      // assert
      expect(result, const Right(testWeatherDetail));
    },
  );
}
