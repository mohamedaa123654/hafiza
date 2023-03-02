import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/global_background.dart';
import 'package:hafiza/core/resources/color_manager.dart';
import 'package:hafiza/core/resources/styles_manager.dart';
import 'package:hafiza/features/main/data/models/azkary_model.dart';
import 'package:hafiza/features/main/presentation/screens/azkary/zikr_screen.dart';
import 'package:sizer/sizer.dart';
import '../../controller/azkary_controller.dart';

class AzkaryList extends StatelessWidget {
  AzkaryList({super.key});
  AzkaryController controller = Get.put(AzkaryController());
  @override
  Widget build(BuildContext context) {
    return GlobalBackgroundWidget(
      title: "الأذكار",
      isMainScreens: true,
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 32.w,
                crossAxisSpacing: 3.w,
                mainAxisSpacing: 1.w,
                childAspectRatio: 0.8),
            itemCount: controller.azkaryTitleList.length,
            itemBuilder: (context, index) {
              return AzkaryTitleItem(model: controller.azkaryTitleList[index]);
            },
          )
          // ListView.builder(
          //   physics: const BouncingScrollPhysics(),
          //   itemBuilder: (context, index) =>
          //       AzkaryTitleItem(model: cubit.azkaryTitleList[index]),
          //   itemCount: cubit.azkaryTitleList.length,
          // ),
          ),
    );
  }
}

class AzkaryTitleItem extends StatelessWidget {
  AzkaryTitleItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AzkaryTitleModel model;
  AzkaryController controller = Get.put(AzkaryController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        controller.id.value = model.id!;
        controller.title.value = model.name!;
        await controller.loadSections(context);
        Get.to(() => zikrScreen());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: 30.w,
        height: 60.w,
        decoration: containerStyle(ColorManager.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/azkary/${model.id}.png',
              width: 15.w,
              height: 15.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Text(
                "${model.name}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
