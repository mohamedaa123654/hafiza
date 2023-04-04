import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
  List<String> allsuar = [];
  Future<List<String>> loadFromFile() async {
    try {
      final file = File('assets/quran.txt');
      final contents = await rootBundle.loadString('assets/quran.txt');
      final quran = <String>[];
      var currentSurah = '';
      var currentSurahText = '';

      for (final line in contents.split('\n')) {
        final parts = line.split('|');
        final surahNumber = parts[0];
        final text = parts[2];

        if (surahNumber != currentSurah) {
          quran.add(currentSurahText);
          currentSurah = surahNumber;
          currentSurahText = '';
        }

        currentSurahText += text.trim() + '﴿${line.split('|')[1]}﴾';
      }

      quran.add(currentSurahText);

      final fullQuranText = quran.join('\n');
      allsuar = quran;

      print('XXXXXXXXXXX$fullQuranText');
      // print(contents.split('\n')[0]);
      return quran;
    } catch (e) {
      print('Error loading data from file: $e');
      return [];
    }
  }

  String sura = '';
  getSura(suraId) {
    sura = allsuar[suraId];
  }

  var suwar = [].obs;

  loadSuwar() async {
    suwar = [].obs;
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

  @override
  void onInit() async {
    loadFromFile();
    loadSuwar();
    super.onInit();
  }

  void goToPage({required int pageNumber}) {}
}
