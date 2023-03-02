import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/resources/assets_manager.dart';
import 'package:hafiza/features/main/data/models/quran_model.dart';

class QuranController extends GetxController {
  var suwar = [].obs;
  loadSuwar() async {
    print('_______________________________starting');
    suwar = [].obs;
    DefaultAssetBundle.of(Get.context!)
        .loadString(JsonAssets.quran)
        .then((data) {
      var response = json.decode(data);
      response.forEach((surah) {
        QuranModel _section = QuranModel.fromJson(surah);
        suwar.add(_section);
      });
      print(suwar.value.length);
      print('_______________________________ending');
    }).catchError((error) {});
  }

  @override
  void onInit() {
    loadSuwar();
    super.onInit();
  }
}
