import 'package:flutter_weatherapp/app/data/repository/weahter_repository_impl.dart';
import 'package:flutter_weatherapp/app/domain/repository/weather_repository.dart';
import 'package:flutter_weatherapp/core/base/base_module.dart';
import 'package:get/get.dart';

class RepositoryModule extends BaseModule {
  @override
  void init() {
    Get.lazyPut<WeatherRepository>(() {
      return WeatherRepositoryImpl();
    });
  }
}
