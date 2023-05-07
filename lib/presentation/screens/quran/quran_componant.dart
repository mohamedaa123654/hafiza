import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/models/juzaa_model.dart';
import 'package:hafiza/data/models/quran_model.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/screens/quran/swra_screen.dart';
import 'package:sizer/sizer.dart';

QuranController controller = Get.put(QuranController());

Widget buildSuraItem({required QuranModel model, index, context}) {
  return InkWell(
      onTap: () {
        Get.to(SwraScreen(
          quranModel: model,
          length: controller.getSuraLength(controller.suwar[index].pageNumber!,
              controller.suwar[index + 1].pageNumber!),
          first: controller.suwar[index].pageNumber!,
        ));
      },
      child: Container(
          margin: const EdgeInsets.only(top: 12.0),
          width: double.infinity,
          height: 50.sp,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/star.png'),
                          colorFilter: ColorFilter.mode(
                              ColorManager.primary, BlendMode.srcIn),
                        )),
                        child: Center(
                          child: Text(
                            "${model.number}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.darkPrimary,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${model.name}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.darkPrimary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${model.descent} . ${model.numberVerses! <= 10 ? '${model.numberVerses} آيات' : '${model.numberVerses} آية'} ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Divider(
                endIndent: 2.w,
                indent: 2.w,
                thickness: 2,
                color: ColorManager.containerLightPrimary,
              ),
            ],
          )));
}

Widget buildJuzaaItem({required JuzaaModel model, index, context}) {
  return InkWell(
      onTap: () {
        Get.to(SwraScreen(
          quranModel: model,
          length: controller.getSuraLength(controller.juzaaList[index].page!,
              controller.juzaaList[index + 1].page!),
          first: controller.juzaaList[index].page!,
        ));
      },
      child: Container(
          margin: const EdgeInsets.only(top: 12.0),
          width: double.infinity,
          height: 50.sp,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/star.png'),
                          colorFilter: ColorFilter.mode(
                              ColorManager.primary, BlendMode.srcIn),
                        )),
                        child: Center(
                          child: Text(
                            "${model.id}",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.darkPrimary,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "الجزء ${model.name}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.darkPrimary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "الصفحة ${model.page}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Divider(
                endIndent: 2.w,
                indent: 2.w,
                thickness: 2,
                color: ColorManager.containerLightPrimary,
              ),
            ],
          )));
}
