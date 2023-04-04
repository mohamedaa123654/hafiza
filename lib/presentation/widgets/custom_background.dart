import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/controller/main_controller/main_controller.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/controller/splash_controller/splash_controller.dart';
import 'package:hafiza/presentation/resources/constants_manager.dart';
import 'package:hafiza/presentation/widgets/counter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class CustomBackgroundWidget extends StatelessWidget {
  CustomBackgroundWidget({
    super.key,
    required this.body,
    required this.controller,
  });

  PrayerTimeController controller;

  Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Stack(
              children: [
                Positioned(
                    top: 0.h,
                    child: Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              ImageAssets.homeBG,
                            )),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.settings,
                                color: ColorManager.white,
                                size: 18.sp,
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return controller.isConnected.value &&
                                  controller.isDataLoaded.value
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 12.w,
                                          height: 12.w,
                                          child: SvgPicture.asset(
                                            controller.nextPrayer![3],
                                            fit: BoxFit.fitWidth,
                                            colorFilter: ColorFilter.mode(
                                                ColorManager.white,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                        Text(
                                          'اذان ${controller.nextPrayer![1]}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.white,
                                              fontSize: 12.sp),
                                        ),
                                        Text(
                                          controller.nextPrayer![4],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Maghribi',
                                              color: ColorManager.white,
                                              fontSize: 18.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Obx(() {
                                      return CircularPercentIndicator(
                                        radius: 12.5.w,
                                        lineWidth: 3.sp,
                                        percent: controller.percentage.value,
                                        center: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'باقي من الوقت',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorManager.white,
                                                  fontSize: 8.5.sp),
                                            ),
                                            CounterDown(controller: controller),
                                          ],
                                        ),
                                        progressColor: ColorManager.white,
                                      );
                                    })
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    controller.getPrayTime(
                                        AppConstants.lat, AppConstants.long);
                                  },
                                  child: Container(
                                    width: 60.w,
                                    decoration:
                                        containerStyle(ColorManager.white),
                                    child: Column(children: [
                                      Icon(
                                        Icons.warning,
                                        color: ColorManager.red,
                                        size: 18.sp,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(1.w),
                                        child: Text(
                                          'يجب التأكد من الاتصال بالانترنت لمعرفة مواقيت الصلاة وقم بالضفط هنا',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.black,
                                              fontSize: 8.5.sp),
                                        ),
                                      ),
                                      Icon(
                                        Icons.back_hand_rounded,
                                        color: ColorManager.grey,
                                        size: 26.sp,
                                      ),
                                    ]),
                                  ),
                                );
                        }),
                      ]),
                    )),
                Positioned(
                  bottom: 0,
                  child: Container(
                      width: 100.w,
                      height: 74.h,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: body),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
