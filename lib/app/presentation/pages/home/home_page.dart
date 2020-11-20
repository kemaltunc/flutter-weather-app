import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';
import 'package:flutter_weatherapp/app/presentation/components/loading_view.dart';
import 'package:flutter_weatherapp/app/presentation/pages/home/home_controller.dart';
import 'package:flutter_weatherapp/core/base/base_controller.dart';
import 'package:flutter_weatherapp/core/base/screen_state.dart';
import 'package:get/get.dart';

class HomePage extends BaseView<HomeController> {
  @override
  Widget get insideView => Container(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 120),
            Text(controller.test1.value),
            FlatButton(
                onPressed: () {
                  controller.test1.value = "asdasd";
                },
                child: Text("tikla"))
          ],
        )),
      );
}

abstract class BaseView<T extends BaseController> extends GetView<T> {
  Widget get insideView;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(child: getStateView()));
  }

  Widget getStateView() {
    switch (controller.state.value) {
      case ScreenState.LOADING:
        {
          return Center(child: CircularProgressIndicator());
        }
        break;

      case ScreenState.SUCCESS:
        {
          return insideView;
        }
        break;
      case ScreenState.ERROR:
        {
          return Center(child: Text(controller.errorMessage.value));
        }
        break;
      default:
        {
          return insideView;
        }
        break;
    }
  }
}
