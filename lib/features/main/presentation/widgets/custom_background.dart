import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class CustomBackgroundWidget extends StatelessWidget {
  CustomBackgroundWidget({
    super.key,
    required this.body,
  });
  Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorManager.primary,
        body: Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Stack(
              children: [
                Positioned(
                    top: 0.h,
                    child: Container(
                      height: 32.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              ImageAssets.homeBG,
                            )),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.settings,
                                color: ColorManager.white,
                                size: 18.sp,
                              ),
                              Icon(
                                Icons.location_on,
                                color: ColorManager.white,
                                size: 18.sp,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: ColorManager.white,
                                  size: 18.sp,
                                ),
                                Text(
                                  'اذان العصر',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.white,
                                      fontSize: 16.sp),
                                ),
                                Text(
                                  '03:23 pm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.white,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Container(
                              width: 25.w,
                              height: 25.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: ColorManager.grey.withOpacity(0.5),
                                      width: 2)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: ColorManager.white,
                                    size: 18.sp,
                                  ),
                                  Text(
                                    'اذان العصر',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: ColorManager.white,
                                        fontSize: 14.sp),
                                  ),
                                  Text(
                                    '03:23 pm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: ColorManager.white,
                                        fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    )),
                Positioned(
                  bottom: 0,
                  child: Container(
                      width: 100.w,
                      height: 74.h,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: body),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
