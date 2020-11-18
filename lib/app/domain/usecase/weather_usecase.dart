import 'package:flutter_weatherapp/app/data/source/remote/base/http_response.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';
import 'package:flutter_weatherapp/app/domain/repository/weather_repository.dart';

class WeatherUseCase {
  final WeatherRepository repository;

  WeatherUseCase(this.repository);

  Future<HttpResponse<MainForecast>> getWeather(String query) async {
    return repository.getWeather(query);
  }
}
