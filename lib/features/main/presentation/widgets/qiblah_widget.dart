import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class QiblahWidget extends StatefulWidget {
  QiblahWidget({super.key, required this.height});
  double height = 0;

  @override
  State<QiblahWidget> createState() => _QiblahWidgetState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahWidgetState extends State<QiblahWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FlutterQiblah.qiblahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.w,
                  width: 60.w,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/qiblah.png',
                          height: 30.w,
                          width: 30.w,
                        ),
                      ),
                      Center(
                          child: Container(
                        decoration:
                            containerStyle(ColorManager.containerLightGreen),
                        child: SizedBox(
                          width: 60.w,
                          child: Padding(
                            padding: EdgeInsets.all(1.w),
                            child: Text(
                              'قم بتشغيل خدمة المواقع في جهازك لتتمكن من تحديد القبلة',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorManager.darkPrimary),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            );
          }

          final qiblahDirection = snapshot.data;
          animation = Tween(
                  begin: begin,
                  end: (qiblahDirection!.qiblah * (pi / 180) * -1))
              .animate(_animationController!);
          begin = (qiblahDirection.qiblah * (pi / 180) * -1);
          _animationController!.forward(from: 0);

          return Center(
            child: Padding(
                padding: EdgeInsets.all(2.w),
                child: SizedBox(
                    height: 30.w,
                    child: AnimatedBuilder(
                      animation: animation!,
                      builder: (context, child) => Transform.rotate(
                          angle: animation!.value,
                          child: Image.asset('assets/images/qiblah.png')),
                    ))),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }
}
