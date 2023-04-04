import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    // Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()));
    // Get.lazyPut(() => InternetConnectionChecker());


  }
}
