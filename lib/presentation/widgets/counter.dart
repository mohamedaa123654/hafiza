import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:hafiza/presentation/resources/constants_manager.dart';
import 'package:sizer/sizer.dart';

class CounterDown extends StatelessWidget {
  CounterDown({
    super.key,
    required this.controller,
    // this.onEnd
  });

  final PrayerTimeController controller;
  // void Function()? onEnd;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: CountdownTimer(
          endTime: controller.endTime.value,
          onEnd: () {
            // onEnd;
            print('end');
            controller.calculateNextPrayerTime();
          },
          textStyle: TextStyle(
              // fontWeight: FontWeight.bold,
              fontFamily: 'Maghribi',
              color: ColorManager.white,
              fontSize: 20.sp),
        ),
      );
    });
    // }
  }
}
