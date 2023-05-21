import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/datasource/local/cache_helper.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/widgets/global_background.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  QuranController controller = Get.put(QuranController());
  @override
  Widget build(BuildContext context) {
    return GlobalBackgroundWidget(
      title: "Settings",
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          color: ColorManager.lightGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  color: ColorManager.darkPrimary,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'طريقة العرض',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.darkPrimary,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.isViewAya!.value = true;
                                  CacheHelper.saveDataSharedPreference(
                                      key: 'isViewAya', value: true);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'تصفح بالصفحة',
                                      style: TextStyle(
                                        color: ColorManager.darkPrimary,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: controller.isViewAya!.value
                                              ? ColorManager.darkPrimary
                                              : ColorManager.grey2,
                                          width: 4.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the value to change the border radius
                                      ),
                                      child: Image.asset(
                                        ImageAssets.ayatImage,
                                        width: 15.h,
                                        height: 15.h,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.isViewAya!.value = false;
                                  CacheHelper.saveDataSharedPreference(
                                      key: 'isViewAya', value: false);
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'تصفح بالاية',
                                      style: TextStyle(
                                        color: ColorManager.darkPrimary,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: controller.isViewAya!.value
                                              ? ColorManager.grey2
                                              : ColorManager.darkPrimary,
                                          width: 4.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the value to change the border radius
                                      ),
                                      child: Image.asset(
                                        ImageAssets.suraImage,
                                        width: 15.h,
                                        height: 15.h,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  IgnorePointer(
                    ignoring: !controller.isViewAya!.value,
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                            color: !controller.isViewAya!.value
                                ? ColorManager.containerGrey
                                : ColorManager.lightGrey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Text(
                              'حجم الخط',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: !controller.isViewAya!.value
                                    ? ColorManager.grey
                                    : ColorManager.darkPrimary,
                                fontSize: 15,
                              ),
                            ),
                            Obx(() {
                              return Slider(
                                value: controller.arabicFontSize.value,
                                min: 20,
                                max: 40,
                                activeColor: !controller.isViewAya!.value
                                    ? ColorManager.grey
                                    : ColorManager.primary,
                                onChanged: (value) {
                                  controller.arabicFontSize.value = value;
                                  CacheHelper.saveDataSharedPreference(
                                      key: 'arabicFontSize', value: value);
                                },
                              );
                            }),
                            Obx(() {
                              return Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Container(
                                  width: 100.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    color: !controller.isViewAya!.value
                                        ? ColorManager.grey2
                                        : ColorManager.containerLightPrimary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'quran',
                                          color: !controller.isViewAya!.value
                                              ? ColorManager.grey
                                              : ColorManager.darkPrimary,
                                          fontSize:
                                              controller.arabicFontSize.value),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
