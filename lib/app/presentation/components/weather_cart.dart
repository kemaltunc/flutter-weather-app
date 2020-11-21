import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';
import 'package:flutter_weatherapp/core/components/vertical_space.dart';

class WeatherCard extends StatelessWidget {
  final Hour hour;

  const WeatherCard({Key key, this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(hour.tempC.toString() + " °")),
              Text(hour.time)
            ],
          ),
          VerticalSpace(20),
          Row(
            children: [
              Expanded(
                child: Text(hour.condition.text != null
                    ? textValues.reverse[hour.condition.text]
                    : ""),
              ),
              Image.network("http://"+hour.condition.icon)

            ],
          )
        ],
      ),
    )));
  }
}
