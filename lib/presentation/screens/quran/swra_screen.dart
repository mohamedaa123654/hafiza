import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:sizer/sizer.dart';

class SwraScreen extends StatelessWidget {
  var quranModel;
  String sura;
  int length = 0;
  int? first;
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  // late PDFViewController _PDFViewController;
  QuranController controller = Get.put(QuranController());
  var boardController = PageController();

  SwraScreen(
      {Key? key,
      required this.quranModel,
      this.sura = '',
      this.length = 0,
      this.first = 0})
      : super(key: key);
   bool? isHide;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // return Obx(() {
    return GestureDetector(
        onTap: () {
          // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
          //     overlays: [
          //       SystemUiOverlay.bottom,
          //     ]);

          controller.showAppBar.value = !controller.showAppBar.value;

          if (isHide.isNull) {
            hideStatusBar();
            isHide = true;
          } else if (!isHide!) {
            hideStatusBar();
            isHide = true;
          } else {
            showStatusBar();
            isHide = false;
          }
        },
        child: Scaffold(
            // backgroundColor: ColorManager.bgColor,
            resizeToAvoidBottomInset: false,
            appBar: null,
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {},
                itemBuilder: (context, index) => Image.asset(
                  'assets/quranImages/${first! + index}.png',
                  fit: BoxFit.fill,
                ),
                itemCount: length,
              ),
            )));
    // });
  }

  appBar() {
    if (controller.showAppBar.value) {
      return AppBar(
          // title: const Text('Hide Status Bar'),
          );
    } else {
      return null;
    }
  }

  showStatusBar() =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [
        SystemUiOverlay.bottom,
      ]);
  hideStatusBar() =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
}
