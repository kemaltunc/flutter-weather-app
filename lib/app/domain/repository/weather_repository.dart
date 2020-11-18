import 'package:flutter_weatherapp/app/data/source/remote/base/http_response.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';


abstract class WeatherRepository {
  Future<HttpResponse<MainForecast>> getWeather(String query);
}
