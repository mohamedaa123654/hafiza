import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/screens/main/main_view.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/screens/azkary/azkary_list.dart';
import 'package:hafiza/presentation/screens/quran/quran_list.dart';
import 'package:hafiza/presentation/screens/setting/setting_screen.dart';

import '../../screens/test.dart';

class HomeController extends GetxController {
  // @override
  // void onInit() {
  //   getUserLocation();
  //   super.onInit();
  // }

  RxInt navigatorValue = 0.obs;

  List<String> bNBIcons = const [
    ImageAssets.homeIcon,
    ImageAssets.prayIcon,
    ImageAssets.optionsIcon,
    ImageAssets.categoryIcon,
  ];

  List<String> bNBTitle = const [
    'الرئيسية',
    'الدعاء',
    'الموضوعات',
    'المزيد',
  ];

  List<Widget> screens = [
    MainView(),
    AzkaryList(),
    MainView(),
    SettingScreen(),
    QuranList(),
  ];
}
