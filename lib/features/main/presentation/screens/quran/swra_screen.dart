import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:hafiza/core/resources/assets_manager.dart';
import 'package:hafiza/core/resources/color_manager.dart';
import 'package:hafiza/core/resources/styles_manager.dart';
import 'package:hafiza/features/main/data/models/quran_model.dart';
import 'package:hafiza/features/main/presentation/controller/quran/quran_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SwraScreen extends StatelessWidget {
  QuranModel? quranModel;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  SwraScreen({Key? key, required this.quranModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.bgColor,
        appBar: AppBar(
          title: Text(quranModel!.name!),
          elevation: 0,
          flexibleSpace: const Image(
            image: AssetImage(ImageAssets.homeBG),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GetBuilder<QuranController>(builder: (controller) {
                  return Center(
                    child:
                        // SfPdfViewer.asset(
                        //   'assets/db/quran.pdf',
                        //   // key: _pdfViewerKey,
                        //   controller: _pdfViewerController.,
                        //   canShowScrollHead: false,
                        //   enableDoubleTapZooming: false,
                        //   canShowScrollStatus: false,
                        //   enableTextSelection: false,
                        //   pageLayoutMode: PdfPageLayoutMode.single,
                        //   // scrollDirection: PdfScrollDirection.vertical,
                        // ),
                        PDF(
                      fitPolicy: FitPolicy.BOTH,
                      autoSpacing: true,
                      // nightMode: true,
                      // enableSwipe: false,
                      // gestureRecognizers: ,
                      // gestureRecognizers: <
                      //     Factory<OneSequenceGestureRecognizer>>{
                      //   Factory<OneSequenceGestureRecognizer>(
                      //     () => EagerGestureRecognizer(),
                      //   ),
                      // },

                      onPageChanged: (int? page, int? total) {
                        // print('page change: $page/$total');
                        // page = 1;
                        // total = 2;
                        controller.update();
                      },
                      defaultPage: quranModel!.pageNumber!,
                      // swipeHorizontal: true
                    ).fromAsset('assets/db/quran.pdf'),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

//   late int id;
//  title: Text(surah[id-1]['arabic']),