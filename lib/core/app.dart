import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weatherapp/app/presentation/pages/splash/splash_page.dart';
import 'package:flutter_weatherapp/core/di/app_module.dart';
import 'package:flutter_weatherapp/core/di/repository_module.dart';
import 'package:flutter_weatherapp/core/di/service_module.dart';
import 'package:get/get.dart';
import 'base/base_module.dart';
import 'di/controller_module.dart';
import 'values/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
        onInit: () {
          Modules([
            AppModule(),
            ServiceModule(),
            RepositoryModule(),
            ControllerModule()
          ]).start();
        },
        title: "WeatherApp",
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: SplashPage());
  }
}
