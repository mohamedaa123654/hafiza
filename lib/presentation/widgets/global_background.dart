import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class GlobalBackgroundWidget extends StatelessWidget {
  GlobalBackgroundWidget(
      {super.key,
      required this.body,
      required this.title,
      this.isMainScreens = false,
      });
  Widget body;
  bool isMainScreens;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
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
                              padding: EdgeInsets.fromLTRB(2.w, 5.h, 2.w, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  isMainScreens
                                      ? const SizedBox()
                                      : IconButton(
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: ColorManager.white,
                                          ),
                                          onPressed: () {
                                            Get.back();
                                            
                                          },
                                        ),
                                  Text(
                                    title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.white,
                                        fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  )
                                ],
                              ),
                            ),
                          ]),
                        )),
                    Positioned(
                      bottom: 9.h,
                      child: Container(
                          width: 100.w,
                          height: 78.h,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
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
