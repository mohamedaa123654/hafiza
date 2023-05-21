import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/data/models/main_model.dart';
import 'package:hafiza/presentation/resources/assets_manager.dart';
import 'package:hafiza/presentation/resources/constants_manager.dart';
import 'package:hafiza/presentation/screens/prayer_time/prayer_time.dart';

class MainController extends GetxController {
  final NetworkInfo networkInfo;
  MainController(this.networkInfo);
  late RxBool hasPermission = false.obs;
  RxBool isConnected = false.obs;
  RxBool isDataLoaded = false.obs;
  @override
  void onInit() async {
    getLocation();

    super.onInit();
  }

  List<MainModel> mainList = [
    MainModel(
        image: ImageAssets.prayTimeIcon,
        name: "مواقيت الصلاة",
        onTap: () {
          Get.to(PrayerTimeScreen());
        }),
        MainModel(
        image: ImageAssets.mosqueIcon,
        name: "اقرب مسجد",
        onTap: () {
          Get.to(PrayerTimeScreen());
        }),MainModel(
        image: ImageAssets.khatmaIcon,
        name: "ختمة",
        onTap: () {
          Get.to(PrayerTimeScreen());
        }),
  ];

  double? latitude;
  double? longitude;
  //----------------------------------------------------Get User Location
  getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();

    if (permission == LocationPermission.denied) {
      // Handle denied permission
      latitude = 30.033333;
      longitude = 31.233334;
    } else if (permission == LocationPermission.deniedForever) {
      // Handle denied permission permanently
      latitude = 30.033333;
      longitude = 31.233334;
    } else {
      // Handle accept permission
      latitude = position.latitude;
      longitude = position.longitude;
    }
    AppConstants.lat = latitude!;
    AppConstants.long = longitude!;
  }
}
