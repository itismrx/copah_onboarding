import 'dart:ui';

class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = 'd39d56c77e53ff78e679b0861e2b1daa';
  static String currentWeatherByGeoLocation(String lat, String lng) =>
      '$baseUrl/weather?lat=$lat&lon=$lng&units=metric&appid=$apiKey'; // TODO : Add filter by metrics
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}

class AppColors {
  static const Color primary = Color(0xffFF5700);
  static const Color cardColor = Color(0xffF6F6F6);
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffffffff);
}
