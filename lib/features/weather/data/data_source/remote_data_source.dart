import 'dart:convert';

import 'package:coopah_onboarding/core/constants/constants.dart';
import 'package:coopah_onboarding/core/errors/errors.dart';
import 'package:coopah_onboarding/features/weather/data/models/weather.dart';
import "package:http/http.dart" as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String lat, String lng, TempUnit unit);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(
      String lat, String lng, TempUnit unit) async {
    final response = await http
        .get(Uri.parse(Urls.currentWeatherByGeoLocation(lat, lng, unit)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
