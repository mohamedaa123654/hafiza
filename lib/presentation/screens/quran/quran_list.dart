import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/models/juzaa_model.dart';
import 'package:hafiza/presentation/screens/quran/quran_componant.dart';
import 'package:hafiza/presentation/screens/quran/swra_screen.dart';
import 'package:hafiza/presentation/screens/quran/to_arabic_no_converter.dart';
import 'package:hafiza/presentation/widgets/global_background.dart';
import 'package:hafiza/data/models/quran_model.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:sizer/sizer.dart';

class QuranList extends StatelessWidget {
  QuranList({Key? key}) : super(key: key);
  QuranController controller = Get.put(QuranController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: GlobalBackgroundWidget(
        title: "القران الكريم",
        isMainScreens: true,
        body:
            // CustomScrollView(
            //   slivers: <Widget>[
            //     SliverFillRemaining(
            //       hasScrollBody: true,
            //       child:
            Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: SizedBox(
                  height: 6.h,
                  width: 100.w,
                  child: TabBar(
                      indicatorColor: ColorManager.darkPrimary,
                      indicatorWeight: 4,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      tabs: [
                        Text(
                          'السور',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.darkPrimary,
                          ),
                        ),
                        Text(
                          'الاجزاء',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.darkPrimary,
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                width: 100.w,
                height: 70.h,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.sp,
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 2.h),
                        itemBuilder: (context, index) => buildSuraItem(
                            model: controller.suwar[index],
                            index: index,
                            context: context),
                        itemCount: controller.suwar.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: GetBuilder<QuranController>(builder: (controller) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 2.h),
                          itemBuilder: (context, index) => buildJuzaaItem(
                              model: controller.juzaaList[index],
                              index: index,
                              context: context),
                          itemCount: controller.juzaaList.length,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
