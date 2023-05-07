import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/widgets/global_background.dart';
import 'package:hafiza/presentation/controller/main_controller/main_controller.dart';
import 'package:hafiza/presentation/screens/qiblah_screen/qiblah_widget.dart';
import 'package:sizer/sizer.dart';

class QiblahScreen extends StatelessWidget {
  // QiblahScreen({super.key, required this.controller});
  // MainController controller;

  @override
  Widget build(BuildContext context) {
    return GlobalBackgroundWidget(
     
      body: Padding(
          padding: EdgeInsets.only(top: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QiblahScreenWidget(),
            ],
          )),
      title: 'القبلة',
    );
  }
}
