import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/global_background.dart';
import 'package:hafiza/core/resources/color_manager.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../controller/azkary_controller.dart';

class zikrScreen extends StatelessWidget {
  final controller = Get.put(AzkaryController());

  @override
  Widget build(BuildContext context) {
    return GlobalBackgroundWidget(
      title: controller.title.value,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.boardController,
                    physics: const BouncingScrollPhysics(),
                    // controller: controller.boardController,
                    onPageChanged: (int index) {
                      controller.updateZikrPage(index);
                    },
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 100.w,
                        height: 80.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Text(
                            "${controller.azkaryList[index].zekr}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Othmani',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.azkaryList.length,
                  ),
                ),
                Obx(() {
                  return Visibility(
                    visible: controller.azkaryList[controller.index].count! > 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                          onTap: () {
                            controller.updateZikrCount();
                          },
                          child: CircularPercentIndicator(
                            radius: 12.w,
                            lineWidth: 10.0,
                            percent: controller.percent.value,
                            // animateFromLastPercent: true,

                            center: Text(
                              '${controller.count}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12.sp),
                            ),
                            progressColor: Colors.green,
                          )),
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    controller.boardController.jumpToPage(controller.index + 1);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 12.0),
                    width: 100.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorManager.primary.withOpacity(1),
                            ColorManager.primary.withOpacity(0.9),
                            ColorManager.primary.withOpacity(0),
                          ]),
                    ),
                    child: Center(
                        child: Text(
                      'التالي',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: ColorManager.white),
                    )),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
