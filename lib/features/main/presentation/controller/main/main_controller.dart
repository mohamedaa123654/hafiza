import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MainController extends GetxController {
  late RxBool hasPermission = false.obs;

  @override
  void onInit() {
    print(hasPermission.value);
    if (hasPermission.value) {
    } else {
      getPermission();
    }

    super.onInit();
  }

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission.value = true;
      } else {
        Permission.location.request().then((value) {
          hasPermission.value = (value == PermissionStatus.granted);
        });
      }
    }
  }
}
