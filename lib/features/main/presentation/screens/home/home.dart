import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/features/main/presentation/screens/main/main_view.dart';
import 'package:sizer/sizer.dart';

import '../../controller/home/home_controller.dart';
import '../../widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeController controller = Get.put(Get.find());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Obx(() {
          return SizedBox(
              height: 91.h,
              child: controller.screens[controller.navigatorValue.value]);
        }),
        SizedBox(
          height: 9.h,
          child: Obx(() {
            return BottomNavigation(
              itemIcons: controller.bNBIcons,
              title: controller.bNBTitle,
              selectedIndex: controller.navigatorValue.value,
              onItemPressed: (value) {
                controller.navigatorValue.value = value;
              },
            );
          }),
        ),
      ],
    ));
  }
}
