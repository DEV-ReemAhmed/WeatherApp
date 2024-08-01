import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeathehrLoadedState extends WeatherState {
  final WeatherModel weathermodel;

  WeathehrLoadedState(this.weathermodel);
}

class WeatherFailureStatge extends WeatherState {
  final String errMsg;

  WeatherFailureStatge( this.errMsg);
  
}
