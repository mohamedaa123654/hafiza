import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:hafiza/data/models/quran_model.dart';
import 'package:hafiza/presentation/controller/quran_controller/quran_controller.dart';
import 'package:hafiza/presentation/resources/color_manager.dart';
import 'package:sizer/sizer.dart';

class SwraScreen extends StatelessWidget {
  QuranModel? quranModel;
  String sura;
  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  // late PDFViewController _PDFViewController;
  QuranController controller = Get.put(QuranController());

  SwraScreen({
    Key? key,
    required this.quranModel,
    this.sura = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.bgColor,
        // appBar: controller.isAppBarVisible.value
        //     ? AppBar(
        //         title: Text(quranModel!.name!),
        //         elevation: 0,
        //         flexibleSpace: const Image(
        //           image: AssetImage(ImageAssets.homeBG),
        //           fit: BoxFit.cover,
        //         ),
        //         backgroundColor: Colors.transparent,
        //       )
        //     : null,
        body: SafeArea(
          child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              // child: Padding(
              //   padding: EdgeInsets.all(4.w),
              //   child: Text(
              //     sura.replaceAll('\n', ' '),
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.bold,
              //         color: ColorManager.black),
              //   ),
              // )
              // child: PDFViewer(
              //   path: 'assets/db/quran.pdf',
              //   startPage: 10,
              //   endPage: 15,
              // )
              child: Column(
                children: [
                  // Icon(Icons.lock),
                  // Icon(Icons.arrow_circle_right_outlined),

                  PDF(
                    fitPolicy: FitPolicy.BOTH,
                    autoSpacing: true,
                    defaultPage: quranModel!.pageNumber!,
                    // swipeHorizontal: true
                  ).
                  fromAsset('assets/db/quran.pdf'),
                ],
              ),
              ),
        ));
  }
}

//   late int id;
//  title: Text(surah[id-1]['arabic']),