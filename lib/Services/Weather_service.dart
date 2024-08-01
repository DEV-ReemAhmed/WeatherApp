import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a84d453e7d1c4eee9e3232646242707';
  WeatherService( this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      var response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMassage = e.response?.data['error']['message'] ??
          'oops there was an error,please try later';
      throw Exception(errMassage);
    } catch (e) {
      log(e.toString() as num);
      throw Exception('oops there was an error,please try later');
    }
  }
}
