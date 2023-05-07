import 'package:flutter/material.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/styles_manager.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class PrayerCount extends StatelessWidget {
  const PrayerCount({super.key, });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.w),
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        width: 100.w,
        decoration: containerStyle(ColorManager.containerLightPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Row(
                    children: [
                      Text(
                        'هل صليت العصر اليوم؟',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.darkPrimary,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.w),
                  child: LinearPercentIndicator(
                    isRTL: true,
                    width: 75.w,
                    lineHeight: 1.5.h,
                    percent: 0.5,
                    animation: true,
                    animationDuration: 2500,
                    barRadius: const Radius.circular(16),
                    backgroundColor: ColorManager.white,
                    progressColor: ColorManager.primary,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 1.w, 0, 1.w),
                    child: Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorManager.primary, width: 2.5)),
                    ),
                  ),
                  // SizedBox(
                  //   height: 1.5.w,
                  // ),
                  Text(
                    '0 / 5',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorManager.darkPrimary,
                        fontFamily: 'Maghribi',
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
