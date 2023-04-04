import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/styles_manager.dart';
import 'package:hafiza/presentation/widgets/counter.dart';
import 'package:hafiza/presentation/widgets/global_background.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class PrayerTimeScreen extends StatelessWidget {
  PrayerTimeScreen({
    super.key,
  });
  PrayerTimeController controller = Get.put(Get.find());
  @override
  Widget build(BuildContext context) {
    return GlobalBackgroundWidget(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Container(
              height: 30.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: AssetImage(ImageAssets.containerBG),
                      fit: BoxFit.fitWidth)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: ColorManager.grey.withOpacity(0.4),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorManager.black.withOpacity(0.0),
                      // ColorManager.black.withOpacity(0.0),
                      ColorManager.black.withOpacity(01)
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 12.w,
                          height: 12.w,
                          child: SvgPicture.asset(
                            controller.nextPrayer![3],
                            fit: BoxFit.fitWidth,
                            colorFilter: ColorFilter.mode(
                                ColorManager.white, BlendMode.srcIn),
                          ),
                        ),
                        Text(
                          'اذان ${controller.nextPrayer![1]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white,
                              fontSize: 16.sp),
                        ),
                        Text(
                          controller.nextPrayer![4],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorManager.white,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      thickness: 1.w,
                      indent: 4.w,
                      endIndent: 4.w,
                      color: ColorManager.primary,
                    ),
                    Obx(() {
                      return CircularPercentIndicator(
                        radius: 12.5.w,
                        lineWidth: 3.sp,
                        percent: controller.percentage.value,
                        // animateFromLastPercent: true,

                        center: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(
                            //   Icons.settings,
                            //   color: ColorManager.white,
                            //   size: 18.sp,
                            // ),
                            Text(
                              'باقي من الوقت',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white,
                                  fontSize: 14.sp),
                            ),
                            // Obx(() {
                            //   return Text(
                            //     '${controller.remainingSeconds.value}',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w300,
                            //         color: ColorManager.white,
                            //         fontSize: 12.sp),
                            //   );
                            // }),
                            CounterDown(controller: controller),
                          ],
                        ),

                        progressColor: ColorManager.white,
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              height: 50.h,
              width: 100.w,
              decoration: containerStyle(ColorManager.containerLightGreen),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 12.w,
                            height: 12.w,
                            child: SvgPicture.asset(
                              controller.allPrayers[index][3],
                              fit: BoxFit.fitWidth,
                              colorFilter: const ColorFilter.mode(
                                  ColorManager.primary, BlendMode.srcIn),
                            ),
                          ),
                          Text(
                            controller.allPrayers[index][1],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                                fontSize: 16.sp),
                          ),
                          Text(
                            controller.allPrayers[index][4],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1.w,
                    );
                  },
                  itemCount: 6),
            ),
          )
        ],
      ),
      title: 'مواقيت الصلاة',
    );
  }
}
