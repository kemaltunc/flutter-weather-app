import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';
import 'package:flutter_weatherapp/app/presentation/components/loading_view.dart';
import 'package:flutter_weatherapp/app/presentation/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Colors.white,
          child: LoadingView(
              state: controller.state.value,
              child: HomeBody(
                forecast: controller.forecast,
              ),
              errorMessage: controller.errorMessage),
        ));
  }
}

class HomeBody extends StatelessWidget {
  final MainForecast forecast;

  const HomeBody({Key key, this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final location = forecast.location;

    return Center(child: Text(location.name));
  }
}
