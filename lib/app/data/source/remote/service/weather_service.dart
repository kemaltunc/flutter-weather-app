import 'package:flutter_weatherapp/app/data/source/remote/base/http_response.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';

import '../base/base_service.dart';

class WeatherService extends BaseService {
  final String forecastUrl = "forecast.json";

  Future<HttpResponse<MainForecast>> getWeather(String query) async {
    final response = await get(forecastUrl, params: {"q": query});

    return response.map(
        response.data != null ? MainForecast.fromJson(response.data) : null);
  }
}
