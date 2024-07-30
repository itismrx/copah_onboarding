import 'package:coopah_onboarding/features/weather/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.cityName,
    required super.temperature,
    required super.iconCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      cityName: data['name'],
      temperature: data['main']['temp'],
      iconCode: data['weather'][0]['icon'],
    );
  }
  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: cityName,
      temperature: temperature,
      iconCode: iconCode,
    );
  }
}
