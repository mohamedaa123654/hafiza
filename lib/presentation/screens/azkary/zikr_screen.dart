import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/widgets/global_background.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import '../../controller/azkary_controller/azkary_controller.dart';

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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.w),
                          child: LinearPercentIndicator(
                            isRTL: true,
                            width: 75.w,
                            lineHeight: 1.5.h,
                            percent: controller.percentOfLength.value,
                            // animation: true,
                            animationDuration: 2500,
                            barRadius: const Radius.circular(16),
                            backgroundColor: ColorManager.grey,
                            progressColor: ColorManager.primary,
                          ),
                        );
                      }),
                      Obx(() {
                        return Text(
                          '${controller.azkaryList.length}/${controller.index.value + 1}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.grey),
                        );
                      }),
                    ],
                  ),
                ),
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
                          child: Center(
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
                        ),
                      );
                    },
                    itemCount: controller.azkaryList.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 62.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return Text(
                              controller.azkaryList[controller.index.value]
                                          .count ==
                                      1
                                  ? 'مره واحدة'
                                  : controller
                                              .azkaryList[
                                                  controller.index.value]
                                              .count ==
                                          2
                                      ? 'مرتين'
                                      : '${controller.azkaryList[controller.index.value].count!} مرات',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.grey),
                            );
                          }),
                          Obx(() {
                            return Visibility(
                              visible: controller
                                      .azkaryList[controller.index.value]
                                      .count! >
                                  1,
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
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      progressColor: Colors.green,
                                    )),
                              
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    controller.boardController
                        .jumpToPage(controller.index.value + 1);
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
