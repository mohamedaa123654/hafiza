import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/styles_manager.dart';
import 'package:hafiza/presentation/widgets/counter.dart';
import 'package:hafiza/presentation/widgets/custom_background.dart';
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
    return CustomBackgroundWidget(
      // onEnd: controller.calculateNextPrayerTime(),
      controller: controller,                              
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              height: 45.h,
              width: 100.w,
              alignment: Alignment.topCenter,
              decoration: containerStyle(ColorManager.containerLightPrimary),
              child: Center(
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 1.h),                                                                                                                    
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
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.darkPrimary,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              controller.allPrayers[index][4],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.grey,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        endIndent: 2.w,
                        indent: 2.w,
                        thickness: 2,
                        height: 0.8.h,
                        color: ColorManager.darkPrimary,
                      );
                    },
                    itemCount: 6),
              ),
            ),
          )
        ],
      ),
      // title: 'مواقيت الصلاة',
    );
  }
}
