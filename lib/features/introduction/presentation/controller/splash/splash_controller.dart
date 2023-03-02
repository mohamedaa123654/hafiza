import 'dart:async';
import 'package:get/get.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/routes_manager.dart';

class SplashController extends GetxController {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {
    Get.offAllNamed(Routes.homeRoute);
  }

  @override
  void onInit() {
    // view model start your job
    _startDelay();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
