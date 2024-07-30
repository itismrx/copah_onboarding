part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

/// Represents an event to fetch weather data.
///
/// Extends WeatherEvent class.
///
/// Parameters:
/// - lat: Latitude of the location to fetch weather data for.
/// - lng: Longitude of the location to fetch weather data for.
/// - unit: Temperature unit for the fetched weather data (default is metric).
///
/// Properties:
/// - lat: Latitude value.
/// - lng: Longitude value.
/// - unit: Temperature unit.
///
/// Override:
/// - props: List of properties to compare for equality.
class WeatherDataFetch extends WeatherEvent {
  final String lat, lng;
  final TempUnit unit;
  const WeatherDataFetch(
      {this.lat = centerLat,
      this.lng = centerLng,
      this.unit = TempUnit.metric});

  @override
  List<Object> get props => [lat, lng, unit];
}
