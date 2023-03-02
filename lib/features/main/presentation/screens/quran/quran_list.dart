import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/global_background.dart';
import 'package:hafiza/core/resources/color_manager.dart';
import 'package:hafiza/features/main/data/models/quran_model.dart';
import 'package:hafiza/features/main/presentation/controller/quran/quran_controller.dart';
import 'package:hafiza/features/main/presentation/screens/quran/swra_screen.dart';
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
        body: Obx(() {
          return TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildSectionItem(
                      model: controller.suwar.value[index], context: context),
                  itemCount: controller.suwar.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
                child: GetBuilder<QuranController>(builder: (controller) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildSectionItem(
                        model: controller.suwar.value[index], context: context),
                    itemCount: controller.suwar.length,
                  );
                }),
              ),
            ],
          );
        }),
      ),
      // child: Scaffold(
      //     appBar: AppBar(
      //       title: const Text("القران الكريم"),
      //       elevation: 0,
      //       backgroundColor: ColorManager.primary.withOpacity(0.5),
      //       centerTitle: true,
      //       bottom: TabBar(
      //           //   onTap: (index) {
      //           //   cubit.emit(QuranChangeTabBarLoadingState());
      //           // },

      //           tabs: [Text("السور"), Text("الاجزاء")]),
      //     ),
      //     body: Obx(() {
      //       return TabBarView(
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 8.sp),
      //             child: ListView.builder(
      //               physics: const BouncingScrollPhysics(),
      //               itemBuilder: (context, index) => buildSectionItem(
      //                   model: controller.suwar.value[index], context: context),
      //               itemCount: controller.suwar.length,
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 8.sp),
      //             child: GetBuilder<QuranController>(builder: (controller) {
      //               return ListView.builder(
      //                 physics: const BouncingScrollPhysics(),
      //                 itemBuilder: (context, index) => buildSectionItem(
      //                     model: controller.suwar.value[index],
      //                     context: context),
      //                 itemCount: controller.suwar.length,
      //               );
      //             }),
      //           ),
      //         ],
      //       );
      //     })),
    );
  }

  Widget buildSectionItem({required QuranModel model, context}) {
    return InkWell(
        onTap: () {
          Get.to(SwraScreen(
            quranModel: model,
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
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "${model.name}",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${model.descent} . ${model.numberVerses} آيات",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
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
                  color: ColorManager.grey2,
                ),
              ],
            )));
  }
}
// buildSectionItem(model: surah[index], context: context),
//                   itemCount: surah.length,

            // id: model['id'],
