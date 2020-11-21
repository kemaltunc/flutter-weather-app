import 'package:flutter_weatherapp/app/data/source/remote/model/response/main_forecast.dart';
import 'package:flutter_weatherapp/app/domain/usecase/weather_usecase.dart';
import 'package:flutter_weatherapp/core/base/base_controller.dart';
import 'package:flutter_weatherapp/core/os/permission_manager.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends BaseController {
  final WeatherUseCase useCase;

  HomeController(this.useCase);

  PermissionManager permissionManager = Get.find();

  Rx<MainForecast> forecast = Rx<MainForecast>();



  @override
  void onInit() async {
    _checkLocation();
    super.onInit();
  }

  Future<void> _checkLocation() async {
    if (await permissionManager.checkLocationPermission()) {
      _getWeather();
    } else {
      permissionManager.getLocationPermission(() {
        _getWeather();
      }, () {
        Get.snackbar(
          "Hava durumu gösterilemedi!",
          "Hava durumunu görebilmek için konum izni vermeniz gerekmektedir.",
        );
      });
    }
  }

  Future<void> _getWeather() async {
    var query = await combineLatLong();

    useCase.getWeather(query).execute((loading) {}, (data) {
      forecast.value = data;
      setSuccess();
    }, (empty) {
      setEmpty("Sonuç bulunamadı");
    }, (_code, _errorMessage) {
      setError(_errorMessage);
    });
  }

  Future<String> combineLatLong() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position != null
        ? position.latitude.toString() + ',' + position.longitude.toString()
        : "0.0,0.0";
  }
}
