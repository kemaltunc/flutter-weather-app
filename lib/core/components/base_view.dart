import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/core/base/base_controller.dart';
import 'package:flutter_weatherapp/core/base/screen_state.dart';
import 'package:get/get.dart';

abstract class BaseView<T extends BaseController> extends GetView<T> {
  
  final backroundColor;
  BaseView({this.backroundColor = Colors.white});

  Widget view(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("first class");
      return Container(color: backroundColor, child: getStateView(context));
    });
  }

  Widget getStateView(BuildContext context) {
    switch (controller.state.value) {
      case ScreenState.LOADING:
        {
          return Center(child: CircularProgressIndicator());
        }
        break;

      case ScreenState.SUCCESS:
        {
          return view(context);
        }
        break;
      case ScreenState.EMPTY:
        {
          return Center(child: Text(controller.message.value));
        }
        break;
      case ScreenState.ERROR:
        {
          return Center(child: Text(controller.message.value));
        }
        break;
      default:
        {
          return view(context);
        }
        break;
    }
  }
}
