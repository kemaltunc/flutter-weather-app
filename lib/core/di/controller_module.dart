import 'package:flutter_weatherapp/app/domain/usecase/weather_usecase.dart';
import 'package:flutter_weatherapp/app/presentation/pages/home/home_controller.dart';
import 'package:flutter_weatherapp/app/presentation/pages/main/main_controller.dart';
import 'package:flutter_weatherapp/app/presentation/pages/splash/splash_controller.dart';
import 'package:flutter_weatherapp/core/base/base_module.dart';

import 'package:get/get.dart';

class ControllerModule extends BaseModule {
  @override
  void init() {
    Get.put(SplashController());
    Get.put(MainController());
    Get.put(HomeController(WeatherUseCase(Get.find())));
  }
}
