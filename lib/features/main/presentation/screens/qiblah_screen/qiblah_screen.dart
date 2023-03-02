import 'package:flutter/material.dart';
import 'package:hafiza/core/global_background.dart';
import 'package:hafiza/features/main/presentation/controller/main/main_controller.dart';
import 'package:hafiza/features/main/presentation/screens/qiblah_screen/qiblah_widget.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/qiblah_widget.dart';

class QiblahScreen extends StatelessWidget {
  QiblahScreen({super.key, required this.controller});
  MainController controller;

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
