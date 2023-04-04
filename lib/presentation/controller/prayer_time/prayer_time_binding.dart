import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'prayer_time_controller.dart';

class PrayerTimeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(PrayerTimeController(
      Get.put<NetworkInfo>(
          NetworkInfoImpl(Get.put(InternetConnectionChecker())))));
   
  }
}
