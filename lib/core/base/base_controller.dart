import 'package:flutter_weatherapp/app/data/source/remote/base/http_response.dart';
import 'package:flutter_weatherapp/core/base/screen_state.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final state = ScreenState.LOADING.obs;
  final message = "".obs;

  void setLoading() {
    state.value = ScreenState.LOADING;
  }

  void setSuccess() {
    state.value = ScreenState.SUCCESS;
  }

  void setEmpty(String _emptyMessage) {
    message.value = _emptyMessage;
    state.value = ScreenState.EMPTY;
  }

  void setError(String _errorMessage) {
    message.value = _errorMessage;
    state.value = ScreenState.ERROR;
  }
}

extension Status on Future<HttpResponse<dynamic>> {
  Future<void> execute(void loading(String loading), void success(data), void empty(String empty),
      void error(int _code, String _errorMessage)) async {
    loading("");

    final result = await this;

    if (result.statusCode == 200) {
      if (result.data != null) {
        success(result.data);
      } else {
        empty("Sonuç bulunamadı");
      }
    } else {
      error(result.statusCode, result.message);
    }
  }
}
