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
        body: SafeArea(
          child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: PDF(
                fitPolicy: FitPolicy.BOTH,
                autoSpacing: false,
                defaultPage: quranModel!.pageNumber!,
                onPageChanged: (int? x, int? y) {
                  print(x);
                  print(y);
                }
                
                // swipeHorizontal: true

                ).fromAsset('assets/db/quran.pdf'),
          ),
        ));
  }
}
