import "package:coopah_onboarding/features/weather/data/data_source/remote_data_source.dart";
import "package:coopah_onboarding/features/weather/domain/repository/weather_repository.dart";
import "package:coopah_onboarding/features/weather/domain/usecases/get_current_weather.dart";
import "package:mockito/annotations.dart";
import 'package:http/http.dart' as http;

@GenerateMocks(
    [WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
