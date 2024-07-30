import 'package:coopah_onboarding/core/errors/failure.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String lat, String lng);
}
