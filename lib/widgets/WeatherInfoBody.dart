import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class Weatherinfobody extends StatelessWidget {
  const Weatherinfobody({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weatherModel.weatheCondition),
              getThemeColor(weatherModel.weatheCondition)[300]!,
              getThemeColor(weatherModel.weatheCondition)[100]!,
              getThemeColor(weatherModel.weatheCondition)[50]!,
            ]),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image}"),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp: ${weatherModel.maxTemp.round().toString()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MinTemp: ${weatherModel.minTemp.round().toString()}',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatheCondition,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
