
import'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';
@JsonSerializable()
class Metadata {
  final String modelRunUpdateTimeUtc;
  final String name;
  final int height;
  final String timezoneAbbreviation;
  final double latitude;
  final String modelRunUtc;
  final double longitude;
  final int utcTimeOffset;
  final double generationTimeMs;

  Metadata({
    required this.modelRunUpdateTimeUtc,
    required this.name,
    required this.height,
    required this.timezoneAbbreviation,
    required this.latitude,
    required this.modelRunUtc,
    required this.longitude,
    required this.utcTimeOffset,
    required this.generationTimeMs,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      modelRunUpdateTimeUtc: json['modelrun_updatetime_utc'],
      name: json['name'],
      height: json['height'],
      timezoneAbbreviation: json['timezone_abbrevation'],
      latitude: json['latitude'].toDouble(),
      modelRunUtc: json['modelrun_utc'],
      longitude: json['longitude'].toDouble(),
      utcTimeOffset: json['utc_timeoffset'],
      generationTimeMs: json['generation_time_ms'].toDouble(),
    );
  }
}

class Units {
  final String predictability;
  final String precipitation;
  final String windSpeed;
  final String precipitationProbability;
  final String relativeHumidity;
  final String temperature;
  final String time;
  final String pressure;
  final String windDirection;

  Units({
    required this.predictability,
    required this.precipitation,
    required this.windSpeed,
    required this.precipitationProbability,
    required this.relativeHumidity,
    required this.temperature,
    required this.time,
    required this.pressure,
    required this.windDirection,
  });

  factory Units.fromJson(Map<String, dynamic> json) {
    return Units(
      predictability: json['predictability'],
      precipitation: json['precipitation'],
      windSpeed: json['windspeed'],
      precipitationProbability: json['precipitation_probability'],
      relativeHumidity: json['relativehumidity'],
      temperature: json['temperature'],
      time: json['time'],
      pressure: json['pressure'],
      windDirection: json['winddirection'],
    );
  }
}


class Data1h {
  final List<String> time;

  Data1h({
    required this.time,
  });

  factory Data1h.fromJson(Map<String, dynamic> json) {
    return Data1h(
      time: List<String>.from(json['time']),
    );
  }
}

class WeatherModel {
  final Metadata metadata;
  final Units units;
  final Data1h data1h;

  WeatherModel({
    required this.metadata,
    required this.units,
    required this.data1h,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      metadata: Metadata.fromJson(json['metadata']),
      units: Units.fromJson(json['units']),
      data1h: Data1h.fromJson(json['data_1h']),
    );
  }
}
