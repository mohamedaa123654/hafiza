import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hafiza/app/network_info.dart';
import 'package:hafiza/presentation/resources/constants_manager.dart';

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
