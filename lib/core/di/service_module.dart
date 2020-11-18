import 'package:flutter_weatherapp/app/data/source/remote/service/weather_service.dart';
import 'package:flutter_weatherapp/core/base/base_module.dart';

import 'package:get/get.dart';

class ServiceModule extends BaseModule {
  @override
  void init() {
    Get.lazyPut(() => WeatherService());
  }
}
