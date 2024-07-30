import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static String apiKey = dotenv.env["API_KEY"] ?? "";
  static String getIconUrl(String iconCode) =>
      "https://openweathermap.org/img/wn/$iconCode@4x.png";
  static String currentWeatherByGeoLocation(
          String lat, String lng, TempUnit unit) =>
      '$baseUrl/weather?lat=$lat&lon=$lng&units=${unit != TempUnit.metric ? "metrics" : "imperial"}&appid=$apiKey';
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}

const String centerLat = "51.51494225418024",
    centerLng = "-0.12363193061883422";

enum TempUnit { metric, imperial }

class AppColors {
  static const Color primary = Color(0xffFF5700);
  static const Color cardColor = Color(0xffF6F6F6);
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
}
