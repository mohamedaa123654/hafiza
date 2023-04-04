import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/models/azkary_model.dart';

class AzkaryController extends GetxController {
  @override
  void onInit() {
    loadSectionsTitle(Get.context);

    super.onInit();
  }

  late List<AzkaryTitleModel> azkaryTitleList = [];
  loadSectionsTitle(context) async {
    azkaryTitleList = [];
    await DefaultAssetBundle.of(context)
        .loadString("assets/db/azkary_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkaryTitleModel _azkaryTitle = AzkaryTitleModel.fromJson(section);
        azkaryTitleList.add(_azkaryTitle);
      });
      update();
    }).catchError((error) {
      print(error);
      update();
    });
  }

  RxInt id = 0.obs;
  RxString title = ''.obs;

  late List<AzkaryModel> azkaryList = [];
  loadSections(context) async {
    azkaryList = [];
    await DefaultAssetBundle.of(context)
        .loadString("assets/db/azkary.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        AzkaryModel _azkaryTitle = AzkaryModel.fromJson(section);
        if (_azkaryTitle.id == id.value) {
          azkaryList.add(_azkaryTitle);
        }
      });
      // print(azkaryList[0].zekr);
      update();
    }).catchError((error) {
      print(error);
      update();
    });
  }

  var boardController = PageController();
  RxInt count = 0.obs;
  // bool isLast = false;
  RxInt index = 0.obs;
  RxDouble percentOfLength = 0.0.obs;

  updateZikrPage(int index) {
    count.value = 0;
    percent.value = 0.0;
    percentOfLength.value = (index + 1) / azkaryList.length;
    this.index.value = index;
  }

  var percent = 0.0.obs;

  updateZikrCount() {
    if (count.value < azkaryList[index.value].count!) {
      count.value += 1;
      percent.value = count.value / azkaryList[index.value].count!;
      if (percent.value == 1) boardController.jumpToPage(index.value + 1);
    }
  }
}
