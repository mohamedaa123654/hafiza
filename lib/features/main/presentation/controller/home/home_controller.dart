import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/resources/assets_manager.dart';
import 'package:hafiza/features/main/presentation/screens/azkary/azkary_list.dart';
import 'package:hafiza/features/main/presentation/screens/quran/quran_list.dart';
import '../../screens/main/main_view.dart';

class HomeController extends GetxController {
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
    MainView(),
    QuranList(),

    // MainView(),
  ];

//Get Prayer Times List
//   late PrayerTimesModel prayerTimesModel;
//   late List<Timing> prayerTimes;
//   late int endTime = 0;
//   void getPrayerTimes(lat, long) {
//     DioHelper.getData(
//       url: ApiConstants.gettime,
//       query: {"latitude": lat, "longitude": long},
//     ).then((value) {
//       prayerTimesModel = PrayerTimesModel.fromJson(value.data);

//       prayerTimes = [
//         Timing(0, "الفجر", prayerTimesModel.timings!.fajr!, false),
//         Timing(1, "الظهر", prayerTimesModel.timings!.dhuhr!, false),
//         Timing(2, "العصر", prayerTimesModel.timings!.asr!, false),
//         Timing(3, "المغرب", prayerTimesModel.timings!.maghrib!, false),
//         Timing(4, "العشاء", prayerTimesModel.timings!.isha!, false),
//       ];

//       endTime = _nextCountdownPrayerTimer();
//       update();
//     }).catchError((error) {});
//   }

//   //Get Next PrayerTimes

//   late int id;
//   int _nextCountdownPrayerTimer() {
//     final now = DateTime.now();

//     TimeOfDay? nextPrayerTime;
//     //get nextPrayerTime
//     for (var value in prayerTimes) {
//       print(value.id);
//       TimeOfDay _nextPrayerTime = TimeOfDay(
//           hour: int.parse(value.time.split(":")[0]),
//           minute: int.parse(value.time.split(":")[1]));
//       if (_nextPrayerTime.hour > now.hour &&
//           _nextPrayerTime.minute > now.minute) {
//         id = value.id;
//         nextPrayerTime = TimeOfDay(
//             hour: int.parse(prayerTimes[id].time.split(":")[0]),
//             minute: int.parse(prayerTimes[id].time.split(":")[1]));

//         print(id);

//         break;
//       } else if (value.id == 4 && _nextPrayerTime.hour < now.hour) {
//         id = value.id;
//         nextPrayerTime = TimeOfDay(
//             hour: int.parse(prayerTimes[0].time.split(":")[0]),
//             minute: int.parse(prayerTimes[0].time.split(":")[1]));
//         break;
//       }
//     }

//     var time = DateTime(now.year, now.month, id == 4 ? now.day + 1 : now.day,
//         nextPrayerTime!.hour, nextPrayerTime.minute);
//     return time.millisecondsSinceEpoch + 1000 * 30;
//   }

// //Edit Time To 12 Hours Mode
//   String editTime(time) {
//     int hour = int.parse(time.toString().split(':')[0]);
//     if (hour > 12) {
//       hour = hour - 12;
//       if (hour.toString().length == 1) {
//         return '0$hour:${time.toString().split(':')[1]} PM';
//       } else {
//         return '$hour:${time.toString().split(':')[1]} PM';
//       }
//     } else {
//       return '$time AM';
//     }
//   }
}
