// This file consist a test to test two main things
// 1. Is the model we have created equal to the entitieis at the domain layer?
// 2. Does fromJson return a valid model
import 'dart:convert';

import 'package:coopah_onboarding/features/weather/data/models/weather.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_from_file.dart';

void main() {
  const testWeatherModel =
      WeatherModel(cityName: 'London', temperature: 23.92, iconCode: '01d');
  test("weather model is a sub class of weather entity class", () async {
    // assert
    expect(testWeatherModel, isA<WeatherModel>());
  });

  test(
    "should return a valid json model",
    () async {
      String localDummyJsonUrl = "helpers/test_data/test_weather_data.json";
      final Map<String, dynamic> loadedJson =
          json.decode(loadJson(localDummyJsonUrl));

      final result = WeatherModel.fromJson(loadedJson);

      expect(result, equals(testWeatherModel));
    },
  );
}
