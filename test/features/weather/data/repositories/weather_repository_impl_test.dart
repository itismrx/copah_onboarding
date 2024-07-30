import 'dart:io';

import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/core/errors/errors.dart';
import 'package:coopah_onboarding/core/errors/failure.dart';
import 'package:coopah_onboarding/features/weather/data/data_source/remote_data_source.dart';
import 'package:coopah_onboarding/features/weather/data/models/weather.dart';
import 'package:coopah_onboarding/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_repository_impl_test.mocks.dart';

@GenerateMocks([
  WeatherRepository,
  WeatherRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
        weatherRemoteDataSource: mockWeatherRemoteDataSource);
  });
  const weatherModel =
      WeatherModel(cityName: 'London', temperature: 23.92, iconCode: '01d');
  const weatherEntity =
      WeatherEntity(cityName: "London", temperature: 23.92, iconCode: "01d");
  const String lat = "51.51494225418024", lng = "-0.12363193061883422";
  const TempUnit unit = TempUnit.metric;

  group("get current wheather", () {
    test("should get weather model on successfull call", () async {
      when(mockWeatherRemoteDataSource.getCurrentWeather(lat, lng, unit))
          .thenAnswer(
        (_) async => weatherModel,
      );
      final result =
          await weatherRepositoryImpl.getCurrentWeather(lat, lng, unit);

      expect(result, equals(const Right(weatherEntity)));
    });
    test("should get an error on unsuccessfull call", () async {
      when(mockWeatherRemoteDataSource.getCurrentWeather(lat, lng, unit))
          .thenThrow(ServerException());
      final result =
          await weatherRepositoryImpl.getCurrentWeather(lat, lng, unit);

      expect(result,
          equals(const Left(ServerFailure("Server error has occured"))));
    });
    test("should get an error if device is not connected to internet",
        () async {
      when(mockWeatherRemoteDataSource.getCurrentWeather(lat, lng, unit))
          .thenThrow(
              const SocketException("unable to connect to the internet  "));
      final result =
          await weatherRepositoryImpl.getCurrentWeather(lat, lng, unit);

      expect(
          result,
          equals(const Left(
              ConnectionFailure("Unable to connect to the server"))));
    });
  });
}
