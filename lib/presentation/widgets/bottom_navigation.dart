import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:sizer/sizer.dart';

import '../resources/color_manager.dart';

class BottomNavigation extends StatelessWidget {
  final List<String> itemIcons;
  final List<String> title;

  final int selectedIndex;
  final Function(int) onItemPressed;
  final double? height;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;
  const BottomNavigation({
    Key? key,
    required this.itemIcons,
    required this.title,
    required this.selectedIndex,
    required this.onItemPressed,
    this.height,
    this.selectedColor = ColorManager.primary,
    this.unselectedColor = const Color(0xffB5C8E7),
    this.selectedLightColor = ColorManager.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.sp),
                      topRight: Radius.circular(16.sp)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(1, -1), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset:
                          const Offset(-1, -1), // changes position of shadow
                    ),
                  ],
                  color: ColorManager.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(0);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      itemIcons[0],
                                      width: selectedIndex == 0 ? 22.sp : 18.sp,
                                      height:
                                          selectedIndex == 0 ? 22.sp : 18.sp,
                                      color: selectedIndex == 0
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[0],
                                    style: TextStyle(
                                        fontSize:
                                            selectedIndex == 0 ? 8.sp : 7.sp,
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex == 0
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(1);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      itemIcons[1],
                                      width: selectedIndex == 1 ? 24.sp : 20.sp,
                                      height:
                                          selectedIndex == 1 ? 24.sp : 20.sp,
                                      color: selectedIndex == 1
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[1],
                                    style: TextStyle(
                                        fontSize:
                                            selectedIndex == 1 ? 8.sp : 7.sp,
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex == 1
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(2);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      itemIcons[2],
                                      width: selectedIndex == 2 ? 22.sp : 18.sp,
                                      height:
                                          selectedIndex == 2 ? 22.sp : 18.sp,
                                      color: selectedIndex == 2
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[2],
                                    style: TextStyle(
                                        fontSize:
                                            selectedIndex == 2 ? 8.sp : 7.sp,
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex == 2
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(3);
                                //   Navigator.pushReplacementNamed(
                                // context, Routes.helpScreen);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      itemIcons[3],
                                      width: selectedIndex == 0 ? 22.sp : 18.sp,
                                      height:
                                          selectedIndex == 0 ? 22.sp : 18.sp,
                                      color: selectedIndex == 3
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[3],
                                    style: TextStyle(
                                        fontSize:
                                            selectedIndex == 3 ? 8.sp : 7.sp,
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex == 3
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  onItemPressed(4);
                  //   Navigator.pushReplacementNamed(
                  // context, Routes.helpScreen);
                },
                child: Container(
                    height: 18.w,
                    width: 18.w,
                    transform: Matrix4.translationValues(0.0, -2.h, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorManager.darkPrimary.withOpacity(1),
                            ColorManager.darkPrimary.withOpacity(0.71),
                            ColorManager.darkPrimary.withOpacity(0),
                          ]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(0.5.w),
                      child: SvgPicture.asset(
                        ImageAssets.quranIcon,
                        width: 50.sp,
                        height: 50.sp,
                        colorFilter: ColorFilter.mode(
                            ColorManager.white, BlendMode.srcIn),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
