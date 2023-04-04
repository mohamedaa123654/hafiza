import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/controller/main_controller/main_controller.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/screens/prayer_time/prayer_time.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(HomeController());
    Get.lazyPut(() => MainController(Get.find()));
    Get.put(PrayerTimeController(
      Get.put<NetworkInfo>(
          NetworkInfoImpl(Get.put(InternetConnectionChecker())))));
    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()));
    Get.put(() => InternetConnectionChecker());
    Get.put(() => PrayerTimeController(Get.find()));

    // Get.lazyPut(() => QuranController());
  }
}
