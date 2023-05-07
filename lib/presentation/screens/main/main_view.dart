import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/resources/routes_manager.dart';
import 'package:hafiza/presentation/screens/main/widgets/prayer_count.dart';
import 'package:hafiza/presentation/screens/main/widgets/qiblah_widget.dart';
import 'package:hafiza/presentation/screens/qiblah_screen/qiblah_screen.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/styles_manager.dart';
import 'package:hafiza/presentation/widgets/custom_background.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  PrayerTimeController controller = Get.put(PrayerTimeController(
      Get.put<NetworkInfo>(
          NetworkInfoImpl(Get.put(InternetConnectionChecker())))));

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      controller: controller,
      // onEnd: controller.calculateNextPrayerTime(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const PrayerCount(),
              Padding(
                  padding: EdgeInsets.only(top: 5.w),
                  child: Container(
                    padding: EdgeInsets.all(1.5.w),
                    height: 32.w,
                    width: 100.w,
                    decoration: containerStyle(ColorManager.white),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.prayerTimeRoute);
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.w),
                                child: Container(
                                  width: 18.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 2,
                                          color: ColorManager.lightGrey)),
                                  child: Image.asset(
                                    ImageAssets.logo,
                                    color: ColorManager.darkPrimary,
                                  ),
                                ),
                              ),
                              Text(
                                'مواقيت الصلاة',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.grey,
                                    fontSize: 9.sp),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
              // LoadingAnimatedButton(
              //   child: Text(
              //     "Loading",
              //     style: TextStyle(
              //         color: Colors.indigo,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16),
              //   ),
              //   color: Colors.indigo,
              //   onTap: () => print("hi"),
              // ),
              SizedBox(
                width: 100.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => QiblahScreen(
                        // controller: controller,
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Container(
                      width: 100,
                      decoration: containerStyle(ColorManager.white),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Text(
                                'القبلة',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.darkPrimary,
                                    fontSize: 16.sp),
                              ),
                            ),
                            // Text(
                            //   "${qiblahDirection.direction.toInt()}°",
                            //   style: const TextStyle(color: Colors.white, fontSize: 24),
                            // ),

                            SizedBox(
                              width: 60.w,
                              child: Center(
                                child: QiblahWidget(
                                  height: 30.w,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
