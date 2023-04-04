import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:sizer/sizer.dart';

class CounterDown extends StatelessWidget {
  const CounterDown({
    super.key,
    required this.controller,
  });

  final PrayerTimeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownTimer(
          endTime: controller.endTime.value,
          textStyle: TextStyle(
              // fontWeight: FontWeight.bold,
              fontFamily: 'Maghribi',
              color: ColorManager.white,
              fontSize: 16.sp),
        ),
      );
    });
  }
}
