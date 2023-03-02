import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import '../../controller/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.textColor,
      body: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImageAssets.splashBG),
            fit: BoxFit.fitHeight,
          )),
          child: Center(
              child: Image.asset(
            ImageAssets.logo,
            width: 50.w,
            height: 40.w,
          ))),
    );
  }
}
