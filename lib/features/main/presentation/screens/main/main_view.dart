import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/resources/color_manager.dart';
import 'package:hafiza/features/main/presentation/controller/main/main_controller.dart';
import 'package:hafiza/features/main/presentation/screens/qiblah_screen/qiblah_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/prayer_count.dart';
import '../../widgets/qiblah_widget.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  MainController controller = Get.put(Get.find(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
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
                        return Column(
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
                                child: Image.asset(ImageAssets.logo),
                              ),
                            ),
                            Text(
                              'مواقيت الصلاة',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.grey,
                                  fontSize: 11.sp),
                            ),
                          ],
                        );
                      },
                    ),
                  )),
              SizedBox(
                width: 100.w,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => QiblahScreen(
                          controller: controller,
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


// Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 40.w,
//                   child: StepProgressIndicator(
//                     totalSteps: 6,
//                     currentStep: 1,
//                     size: 12,
//                     selectedColor: Colors.black,
//                     // unselectedColor: Colors.grey[200],
//                     customStep: (index, color, _) => color == Colors.black
//                         ? Icon(
//                             Icons.check_circle,
//                             color: ColorManager.primary,
//                           )
//                         : Icon(
//                             Icons.check_circle,
//                             color: ColorManager.grey,
//                           ),
//                   ),
//                 ),
//                 Text(
//                   '6/3',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: ColorManager.darkPrimary,
//                       fontSize: 14.sp),
//                 ),
//               ],
//             ),
//           )
      