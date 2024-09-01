
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final int id;
  final String city;
  final String country;
  final double latitude;
  final double longitude;
  final double temperature;
  final String weatherDescription;
  final int humidity;
  final double windSpeed;
  final List<Forecast> forecast;

  WeatherModel({
    required this.id,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.windSpeed,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Forecast {
  final String date;
  final double temperature;
  final String weatherDescription;

  Forecast({
    required this.date,
    required this.temperature,
    required this.weatherDescription,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
