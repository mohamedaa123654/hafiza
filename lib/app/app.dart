import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/controller/main_controller/main_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/routes_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MainController controller = Get.put(
      MainController(Get.put<NetworkInfo>(
          NetworkInfoImpl(Get.put(InternetConnectionChecker())))),
      permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        textDirection: TextDirection.rtl,
        theme: ThemeData(
            primaryColor: ColorManager.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'NotoKufiArabic'),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        getPages: getPages,
      );
    });
  }
}
