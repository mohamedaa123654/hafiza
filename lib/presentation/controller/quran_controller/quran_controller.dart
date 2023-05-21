import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/datasource/local/cache_helper.dart';
import 'package:hafiza/data/models/juzaa_model.dart';
import 'package:hafiza/data/models/quran_model.dart';
import 'package:hafiza/data/models/tafsser_model.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';

class QuranController extends GetxController {
  RxBool isAppBarVisible = false.obs;
  RxBool isStatusBarVisible = false.obs;

  bool? isAyaView = false;
  RxBool? isViewAya = false.obs;

  double arabicFontSizeDefault = 28.0;
  RxDouble arabicFontSize = 28.0.obs;
  double mushafFontSize = 40;

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

  List<TafsserModel> tafsser = <TafsserModel>[].obs;

  loadtafsser() async {
    tafsser = <TafsserModel>[].obs;
    DefaultAssetBundle.of(Get.context!)
        .loadString(JsonAssets.tafsser)
        .then((data) {
      var response = json.decode(data);
      response.forEach((surah) {
        TafsserModel _section = TafsserModel.fromJson(surah);
        tafsser.add(_section);
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

  List<String>? lines;
  Map<String, String>? allSwar;
  loadQuranTxt() async {
    suwar = <QuranModel>[].obs;
    DefaultAssetBundle.of(Get.context!)
        .loadString(JsonAssets.quranTxt)
        .then((data) {
      lines = data.split('\n');
    }).catchError((error) {});
  }

  @override
  void onInit() async {
    loadSuwar();
    loadJuzaaList();
    loadtafsser();
    loadQuranTxt();
    isAyaView =
        CacheHelper.getDataFromSharedPreference(key: 'isViewAya') ?? true;
    isViewAya = isAyaView!.obs;
    arabicFontSizeDefault =
        CacheHelper.getDataFromSharedPreference(key: 'arabicFontSize') ?? 28;
    arabicFontSize = arabicFontSizeDefault.obs;
    super.onInit();
  }

  int getSuraLength(int currentSura, int nextSura) {
    // int reslt = nextSura - currentSura + 1;

    return nextSura - currentSura;
  }
}
