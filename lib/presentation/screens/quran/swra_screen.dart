// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/models/juzaa_model.dart';
import 'package:hafiza/data/models/quran_model.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/widgets/custom_expansion_tile.dart';
import 'package:hafiza/presentation/widgets/global_background.dart';
import 'package:sizer/sizer.dart';

class SwraScreen extends StatelessWidget {
  QuranModel? quranModel;
  JuzaaModel? juzaaModel;
  String sura;
  int length = 0;
  int? first;
  int? swra;
  int? start;
  int? numberVerses;
  QuranController controller = Get.put(QuranController());
  var boardController = PageController();

  SwraScreen(
      {Key? key,
      this.quranModel,
      this.juzaaModel,
      this.sura = '',
      this.swra,
      this.start,
      this.numberVerses,
      this.length = 0,
      this.first = 0})
      : super(key: key);
  bool? isHide;

  @override
  Widget build(BuildContext context) {
    controller.isStatusBarVisible.value
        ? SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values)
        : SystemChrome.setEnabledSystemUIOverlays([]);
    return controller.isViewAya!.value
        ? GlobalBackgroundWidget(
            height: 89,
            location: 0,
            title: quranModel!.name!,
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: CustomExpansionTile(
                        aya: controller.lines![start! + index]
                            .split('|')[2]
                            .replaceAll("\\n", '\n'),
                        controller: controller,
                        tafser: controller.tafsser[swra!].text!,
                        onPressed: () {},
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
                  itemCount: numberVerses!),
            ),
          )
        : Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    controller.isAppBarVisible.value =
                        !controller.isAppBarVisible.value;
                    controller.isStatusBarVisible.value =
                        !controller.isStatusBarVisible.value;
                    controller.isStatusBarVisible.value
                        ? SystemChrome.setEnabledSystemUIOverlays(
                            SystemUiOverlay.values)
                        : SystemChrome.setEnabledSystemUIOverlays([]);
                  },
                  child: Scaffold(
                    body: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: boardController,
                        onPageChanged: (int index) {},
                        itemBuilder: (context, index) => Image.asset(
                          'assets/quranImages/${first! + index}.png',
                          fit: BoxFit.fill,
                        ),
                        itemCount: length,
                      ),
                    ),
                  )),
              Obx(() {
                return controller.isStatusBarVisible.value
                    ? Positioned(
                        top: 0,
                        child: Container(
                          width: 100.w,
                          height: 10.h,
                          color: ColorManager.containerLightPrimary
                              .withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: ColorManager.darkPrimary,
                                      size: 22.sp,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.turned_in_not,
                                      color: ColorManager.darkPrimary,
                                      size: 24.sp,
                                      weight: 4,
                                    ),
                                  ),
                                ]),
                          ),
                        ))
                    : Container();
              }),
            ],
          );
  }
}
