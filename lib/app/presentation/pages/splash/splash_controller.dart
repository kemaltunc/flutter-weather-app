import 'package:flutter_weatherapp/app/presentation/pages/main/main_page.dart';
import 'package:flutter_weatherapp/core/base/base_controller.dart';
import 'package:flutter_weatherapp/core/util/lambda_fuctions.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    delay(1000, () {
      Get.to(MainPage());
    });
  }
}
