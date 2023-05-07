import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/models/juzaa_model.dart';
import 'package:hafiza/data/models/quran_model.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:intl/intl.dart';

class QuranController extends GetxController {
  RxBool isAppBarVisible = false.obs;
  // List<String> quran = [];
  updateAppBarVisibility() {
    isAppBarVisible.value = !isAppBarVisible.value;
    update();
  }
  RxBool showAppBar = true.obs;

  List<QuranModel> suwar = <QuranModel>[].obs;

  loadSuwar() async {
    suwar = <QuranModel>[].obs;
    DefaultAssetBundle.of(Get.context!)
        .loadString(JsonAssets.quran)
        .then((data) {
      var response = json.decode(data);
      response.forEach((surah) {
        QuranModel _section = QuranModel.fromJson(surah);
        suwar.add(_section);
      });
      // print(suwar.value.length);
    }).catchError((error) {});
  }

  List<JuzaaModel> juzaaList = <JuzaaModel>[].obs;

  loadJuzaaList() async {
    juzaaList = <JuzaaModel>[].obs;
    DefaultAssetBundle.of(Get.context!)
        .loadString(JsonAssets.juzaaDB)
        .then((data) {
      var response = json.decode(data);
      response.forEach((surah) {
        JuzaaModel _section = JuzaaModel.fromJson(surah);
        juzaaList.add(_section);
      });
      // print(suwar.value.length);
    }).catchError((error) {});
  }

  @override
  void onInit() async {
    loadSuwar();
    loadJuzaaList();
    super.onInit();
  }

  int getSuraLength(int currentSura, int nextSura) {
    // int reslt = nextSura - currentSura + 1;

    return nextSura - currentSura;
  }
}
