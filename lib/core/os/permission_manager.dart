
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {

  Future<bool> checkLocationPermission() async {
    var status = await Permission.location.status;
    return status.isGranted;
  }

  Future<void> getLocationPermission(Function grandTed, Function denied) async {
    var req = await Permission.location.request();

    if (req.isGranted) {
      grandTed();
    } else {
      denied();
    }
  }
}
