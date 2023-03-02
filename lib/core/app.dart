import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/resources/color_manager.dart';
import 'package:hafiza/core/resources/routes_manager.dart';
import 'package:hafiza/features/main/presentation/controller/main/main_controller.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MainController controller = Get.put(MainController(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        textDirection: TextDirection.rtl,
        theme: ThemeData(
            primaryColor: ColorManager.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Othmani'),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        getPages: getPages,
      );
    });
  }
}
