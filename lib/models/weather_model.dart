class WeatherModel {
  final String cityName;
  final String? image;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatheCondition;

  WeatherModel(
      {required this.cityName,
      this.image,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatheCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatheCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
