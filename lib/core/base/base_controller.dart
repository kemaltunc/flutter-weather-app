
import 'package:flutter_weatherapp/core/base/screen_state.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final state = ScreenState.LOADING.obs;
  final errorMessage = "".obs;

  void setLoading() {
    state.value = ScreenState.LOADING;
  }

  void setSuccess() {
    state.value = ScreenState.SUCCESS;
  }

  void setError(String _errorMessage) {
    errorMessage.value = _errorMessage;
    state.value = ScreenState.ERROR;
  }
}
