part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class OnGeoLocationChanged extends WeatherEvent {
  final String lat, lng;
  const OnGeoLocationChanged(this.lat, this.lng);

  @override
  List<Object> get props => [lat, lng];
}
