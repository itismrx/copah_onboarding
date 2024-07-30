// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.iconCode,
  });

  final String cityName;
  final double temperature;
  final String iconCode;

  @override
  List<Object?> get props => [cityName, temperature, iconCode];
}
