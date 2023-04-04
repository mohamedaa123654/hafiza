
import 'package:get/get.dart';


class SwraController extends GetxController {
  // RxInt id = 0.obs;
  // @override
  // void onInit() {
  //   loadQuraanDetail(Get.context, id.value);
  //   super.onInit();
  // }

  // ///Get Quran data
  // var quranModel = QuranModel().obs;

  // loadQuraanDetail(context, id) async {
  //   // emit(QuranGetCurruntSuraLoadingState());
  //   await DefaultAssetBundle.of(context)
  //       .loadString("assets/db/Quran.json")
  //       .then((data) {
  //     var response = json.decode(data);
  //     response.forEach((suwar) {
  //       QuranModel _quraanDetail = QuranModel.fromJson(suwar);

  //       if (_quraanDetail.number == id) {
  //         quranModel.value = _quraanDetail;
  //       }
  //     });
  //   }).catchError((error) {});
  // }
}
