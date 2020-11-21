import 'package:get/get.dart';

extension GenericIntExt on int {
  double widthPx() {
    return Get.width * (this / 100);
  }

  double heightPx() {
    return Get.height * (this / 100);
  }
}
