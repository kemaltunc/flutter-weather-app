import 'package:flutter_weatherapp/app/data/source/remote/base/http_response.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';
import 'package:flutter_weatherapp/app/data/source/remote/service/weather_service.dart';
import 'package:flutter_weatherapp/app/domain/repository/weather_repository.dart';
import 'package:get/get.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherService service = Get.find();

  @override
  Future<HttpResponse<MainForecast>> getWeather(String query) async {
    return await service.getWeather(query);
  }
}
