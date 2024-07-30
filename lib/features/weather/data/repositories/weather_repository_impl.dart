import 'dart:io';

import 'package:coopah_onboarding/core/errors/errors.dart';
import 'package:coopah_onboarding/core/errors/failure.dart';
import 'package:coopah_onboarding/features/weather/data/data_source/remote_data_source.dart';
import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';
import 'package:coopah_onboarding/features/weather/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String lat, String lng) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(lat, lng);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure("Server error has occured"));
    } on SocketException {
      return const Left(ConnectionFailure("Unable to connect to the server"));
    }
  }
}
