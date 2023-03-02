
import 'package:get/get.dart';
import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(() => MainController(),permanent: true);
  }
}
