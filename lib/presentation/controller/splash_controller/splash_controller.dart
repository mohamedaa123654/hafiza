import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/datasource/remote_datasource.dart';
import 'package:hafiza/data/models/pray_time_model.dart';
import 'package:hafiza/data/repository/repository.dart';
import 'package:hafiza/domain/repository/base_repository.dart';
import 'package:hafiza/domain/usecases/getp_pray_time_usecase.dart';
import 'package:hafiza/presentation/resources/constants_manager.dart';
import 'package:hafiza/presentation/resources/routes_manager.dart';
import 'package:intl/intl.dart';

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
    // getLocation();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
