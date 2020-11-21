import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/app/presentation/components/weather_cart.dart';
import 'package:flutter_weatherapp/core/components/base_view.dart';
import 'package:flutter_weatherapp/app/presentation/pages/home/home_controller.dart';
import 'package:flutter_weatherapp/core/util/import_helper.dart';


class HomePage extends BaseView<HomeController> {
  @override
  Widget view(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              VerticalSpace(8.heightPx()),
              Row(
                children: [
                  Icon(Icons.location_city),
                  HorizantalSpace(12),
                  Text(controller.forecast.value.location.name)
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller
                    .forecast.value.forecast.forecastday.first.hour.length,
                itemBuilder: (context, position) {
                  return WeatherCard(
                    hour: controller.forecast.value.forecast.forecastday.first
                        .hour[position],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
