import "package:coopah_onboarding/features/weather/domain/repository/weather_repository.dart";
import "package:mockito/annotations.dart";
import 'package:http/http.dart' as http;

@GenerateMocks([WeatherRepository],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
