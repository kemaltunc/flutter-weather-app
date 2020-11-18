

import 'package:flutter_weatherapp/core/base/base_module.dart';
import 'package:flutter_weatherapp/core/os/permission_manager.dart';
import 'package:get/get.dart';

class AppModule extends BaseModule{
  @override
  void init() {
    Get.lazyPut(() => PermissionManager());
  }
}