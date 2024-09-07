import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/weather_model.dart';

part'api_service.g.dart';

const String baseUrl = 'https://my.meteoblue.com';
@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio,{String baseUrl=baseUrl}) {
    dio.options = BaseOptions(
      contentType: 'application/json',
    );

    return _ApiService(dio);
  }

  @GET('/packages/basic-1h_basic-day')
  Future<Map<String, dynamic>> fetchWeatherData(
      @Query('apikey') String apiKey,
      @Query('lat') double latitude,
      @Query('lon') double longitude,
      @Query('asl') int altitude,
      @Query('format') String format
      );
}
