import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/Weather_service.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_status.dart';
import 'package:weather_app/models/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeathehrLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureStatge(e.toString()));
    }
  }
}
