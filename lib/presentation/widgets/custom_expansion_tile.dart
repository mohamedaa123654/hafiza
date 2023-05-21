import 'package:flutter/material.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:sizer/sizer.dart';

class CustomExpansionTile extends StatelessWidget {
  String tafser;
  String aya;
  QuranController controller;
  void Function()? onPressed;

  CustomExpansionTile(
      {required this.aya,
      required this.tafser,
      required this.controller,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          aya,
          maxLines: 50,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'me_quran',
              color: ColorManager.black,
              fontSize: controller.arabicFontSize.value),
        ),
        collapsedIconColor: ColorManager.darkPrimary,
        iconColor: ColorManager.black,
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'option1',
              child: Text('Option 1'),
            ),
            const PopupMenuItem<String>(
              value: 'option2',
              child: Text('Option 2'),
            ),
            const PopupMenuItem<String>(
              value: 'option3',
              child: Text('Option 3'),
            ),
          ],
          icon: Icon(
            Icons.more_vert,
            color: ColorManager.darkPrimary,
          ),
        ),
        children: [
          ListTile(
              title: Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Text(tafser,
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'me_quran',
                    color: ColorManager.grey,
                    fontSize: controller.arabicFontSize.value - 2)),
          )),
        ]);
  }
}
