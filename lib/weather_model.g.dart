part of 'weather_model.dart';

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  id: json['id'] as int,
  city: json['city'] as String,
  country: json['country'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  temperature: (json['temperature'] as num).toDouble(),
  weatherDescription: json['weather_description'] as String,
  humidity: (json['humidity'] as num).toInt(),
  windSpeed: (json['wind_speed'] as num).toDouble(),
  forecast: (json['forecast'] as List<dynamic>)
      .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) => <String, dynamic>{
  'id': instance.id,
  'city': instance.city,
  'country': instance.country,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'temperature': instance.temperature,
  'weather_description': instance.weatherDescription,
  'humidity': instance.humidity,
  'wind_speed': instance.windSpeed,
  'forecast': instance.forecast.map((e) => e.toJson()).toList(),
};

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
  date: json['date'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  weatherDescription: json['weather_description'] as String,
);

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
  'date': instance.date,
  'temperature': instance.temperature,
  'weather_description': instance.weatherDescription,
};
