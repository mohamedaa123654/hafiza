import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: true,
              child: Obx(() {
                return TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildSectionItem(
                            model: controller.suwar.value[index],
                            context: context),
                        itemCount: controller.suwar.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: GetBuilder<QuranController>(builder: (controller) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildSectionItem(
                              model: controller.suwar.value[index],
                              context: context),
                          itemCount: controller.suwar.length,
                        );
                      }),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
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
          controller.getSura(model.number);
          Get.to(SwraScreen(
            quranModel: model,
            sura: controller.sura,
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
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        // Center(
                        //   child: Directionality(
                        //     textDirection: TextDirection.ltr,
                        //     child: Text(
                        //         "\uFD3E${(model.number).toString().toArabicNumbers}\uFD3F",
                        //         style: const TextStyle(
                        //           color: Color.fromARGB(255, 0, 0, 0),
                        //           fontFamily: 'me_quran',
                        //           fontSize: 20,
                        //         )),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 2.w,
                        // ),
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


