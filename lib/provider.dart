import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_service.dart';
import 'weather_model.dart';

class WeatherQuery {
  final double latitude;
  final double longitude;

  WeatherQuery({
    required this.latitude,
    required this.longitude,
  });
}

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final weatherApiProvider = Provider<WeatherApi>((ref) {
  final dio = ref.read(dioProvider);
  return WeatherApi(dio);
});

final weatherProvider = FutureProvider.family<WeatherModel, WeatherQuery>((ref, query) async {
  final api = ref.read(weatherApiProvider);
  return api.getWeather(
    query.latitude,
    query.longitude,
  );
});
