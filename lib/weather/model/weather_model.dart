import 'dart:convert';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;

  final List<HourlyForecastModel> hourlyForecast;

  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecast,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeather = map['list'][0];

    return WeatherModel(
      currentTemp: currentWeather['main']['temp'].toDouble(),
      currentSky: currentWeather['weather'][0]['main'],
      currentPressure: currentWeather['main']['pressure'].toDouble(),
      currentWindSpeed: currentWeather['wind']['speed'].toDouble(),
      currentHumidity: currentWeather['main']['humidity'].toDouble(),

      hourlyForecast: (map['list'] as List)
          .skip(1)
          .map((e) => HourlyForecastModel.fromMap(e))
          .toList(),
    );
  }
}

class HourlyForecastModel {
  final DateTime time;
  final double temperature;
  final String sky;

  HourlyForecastModel({
    required this.time,
    required this.temperature,
    required this.sky,
  });

  factory HourlyForecastModel.fromMap(Map<String, dynamic> map) {
    return HourlyForecastModel(
      time: DateTime.parse(map['dt_txt']),
      temperature: map['main']['temp'].toDouble(),
      sky: map['weather'][0]['main'],
    );
  }
}
