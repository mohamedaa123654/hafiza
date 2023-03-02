import 'package:get/get.dart';
import 'package:hafiza/features/main/presentation/controller/main/main_controller.dart';
import 'package:hafiza/features/main/presentation/controller/quran/quran_controller.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(HomeController());
    Get.lazyPut(() => MainController());
    // Get.lazyPut(() => QuranController());
  }
}
