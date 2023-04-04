import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(() => MainController(Get.find()), permanent: true);
   Get.put(PrayerTimeController(
      Get.put<NetworkInfo>(
          NetworkInfoImpl(Get.put(InternetConnectionChecker())))));
  }
}
