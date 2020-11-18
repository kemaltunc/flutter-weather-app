
import 'package:flutter_weatherapp/app/presentation/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    
    final splashText = Center(
        child: Text("WeatherApp",
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)));

    return Material(
      color: Colors.red,
      child: splashText,
    );
  }
}
