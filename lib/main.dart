import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_status.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatheCondition),
                ),
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatheCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.amber;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.lightBlue;
    case "Mist":
      return Colors.purple;
    case "Patchy rain possible":
      return Colors.brown;
    case "Patchy snow possible":
      return Colors.blueGrey;
    case "Patchy sleet possible":
      return Colors.blueGrey;
    case "Patchy freezing drizzle possible":
      return Colors.pink;
    case "Thundery outbreaks possible":
      return Colors.red;
    case "Blowing snow":
      return Colors.blueGrey;
    case "Blizzard":
      return Colors.blueGrey;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.blueGrey;
    case "Light drizzle":
      return Colors.lightBlue;
    case "Heavy freezing drizzle":
      return Colors.pink;
    case "Light rain":
      return Colors.brown;
    case "Moderate rain":
      return Colors.grey;
    case "Heavy rain at times":
      return Colors.red;
    case "Light freezing rain":
      return Colors.blueGrey;
    case "Moderate or heavy freezing rain":
      return Colors.pink;
    case "Light sleet":
      return Colors.blueGrey;
    case "Moderate or heavy sleet":
      return Colors.blueGrey;
    case "Patchy light snow":
      return Colors.indigo;
    case "Light snow":
      return Colors.blueGrey;
    case "Patchy moderate snow":
      return Colors.pink;
    case "Moderate snow":
      return Colors.blueGrey;
    case "Patchy heavy snow":
      return Colors.blueGrey;
    case "Heavy snow":
      return Colors.blueGrey;
    default:
      return Colors.blue;
  }
}
