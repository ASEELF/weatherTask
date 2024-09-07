import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_service.dart';
import 'weather_model.dart';

final weatherProvider = ChangeNotifierProvider<WeatherProvider>((ref) {
  final dio = Dio();
  final apiService = ApiService(dio);
  return WeatherProvider(apiService);
});

class WeatherProvider extends ChangeNotifier {
  final ApiService _apiService;

  WeatherProvider(this._apiService);

  WeatherModel? _weatherData;
  WeatherModel? get weatherData => _weatherData;

  Future<void> fetchWeather({
    required String apiKey,
    required double latitude,
    required double longitude,
    required int altitude,
    required String format,
  }) async {
    try {
      // Attempt to fetch the weather data from the API
      final response = await _apiService.fetchWeatherData(
        apiKey,
        latitude,
        longitude,
        altitude,
        format,
      );

      // Assuming the response data is in the expected format
      _weatherData = response as WeatherModel?;
      notifyListeners();

    } on DioException catch (e) {
      // Handle Dio-specific errors
      if (e.response != null) {
        // Server responded with a status code other than 200
        print('DioError: ${e.response?.statusCode} - ${e.response?.statusMessage}');
        print(_weatherData?.data1h);
        print(_weatherData?.metadata);
        print(_weatherData?.units);

      } else {
        // Network error or other Dio errors
        print('DioError: ${e.message  } ${e.stackTrace}');
      }
    } catch (e) {
      // Handle other types of errors
      print('Unexpected error: $e');
    }
  }
}
