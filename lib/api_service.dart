import 'package:dio/dio.dart';
import 'weather_model.dart';

class WeatherApi {
  final Dio _dio;

  WeatherApi([Dio? dio])
      : _dio = dio ??
      Dio(BaseOptions(
        baseUrl: 'https://freetestapi.com/api/v1/products',

      ));

  Future<WeatherModel> getWeather(
      double latitude,
      double longitude,
      ) async {
    final queryParameters = {
      'latitude': latitude,
      'longitude': longitude,

    };

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/products',
        queryParameters: queryParameters,
      );

      print('Raw response data: ${response.data}');

      if (response.data != null) {
        return WeatherModel.fromJson(response.data!);
      } else {
        throw Exception('Response data is null or not in expected format.');
      }
    } on DioError catch (e) {
      print('DioError: ${e.message}');
      throw e;
    }
  }
}
