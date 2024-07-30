import 'package:coopah_onboarding/features/weather/data/data_source/remote_data_source.dart';
import 'package:coopah_onboarding/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:coopah_onboarding/features/weather/domain/repository/weather_repository.dart';
import 'package:coopah_onboarding/features/weather/domain/usecases/get_current_weather.dart';
import 'package:coopah_onboarding/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocater = GetIt.instance;

void initDepInjection() {
  serviceLocater.registerFactory(() => WeatherBloc(serviceLocater()));

  serviceLocater
      .registerLazySingleton(() => GetCurrentWeatherUseCase(serviceLocater()));

  serviceLocater.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: serviceLocater()),
  );

  serviceLocater.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: serviceLocater()));

  serviceLocater.registerLazySingleton(() => http.Client);
}
