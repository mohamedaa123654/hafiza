import 'package:get/get.dart';
import 'package:hafiza/presentation/controller/home_controller/home_binding.dart';
import 'package:hafiza/presentation/controller/prayer_time/prayer_time_binding.dart';
import 'package:hafiza/presentation/controller/splash_controller/splash_binding.dart';
import 'package:hafiza/presentation/screens/home/home.dart';
import 'package:hafiza/presentation/controller/main_controller/main_binding.dart';
import 'package:hafiza/presentation/screens/main/main_view.dart';
import 'package:hafiza/presentation/screens/prayer_time/prayer_time.dart';
import '../screens/splash/splash_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String mainRoute = "/main";
  static const String prayerTimeRoute = "/prayerTime";
  static const String contactUsRoute = "/contactUs";
  static const String ourProductsRoute = "/ourProducts";
  static const String ourBranchRoute = "/ourBranch";
  static const String chooseLocationRoute = "/chooseLocation";
  static const String aboutUsRoute = "/aboutUs";
  static const String chooseMedicalNetworkView = "/chooseMedicalNetworkView";
  static const String medicalNetworkView = "/medicalNetworkView";
  static const String medicalNetworkVIPView = "/medicalNetworkVIPView";
}

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: Routes.splashRoute,
      page: () => SplashView(),
      binding: SplashBinding()),
  GetPage(
      name: Routes.homeRoute, page: () => HomeScreen(), binding: HomeBinding()),
  GetPage(
      name: Routes.mainRoute, page: () => MainView(), binding: MainBinding()),
  GetPage(
      name: Routes.prayerTimeRoute,
      page: () => PrayerTimeScreen(),
      binding: PrayerTimeBinding()),
  // GetPage(
  //     name: Routes.contactUsRoute,
  //     page: () => ContactUsView(),
  //     binding: ContactUsBinding()),
  // GetPage(
  //     name: Routes.ourProductsRoute,
  //     page: () => OurProductsView(),
  //     binding: OurProductsBinding()),
  // GetPage(
  //     name: Routes.ourBranchRoute,
  //     page: () => OurBranchView(),
  //     binding: OurBranchBinding()),
  // GetPage(
  //     name: Routes.chooseLocationRoute,
  //     page: () => ChooseStateView(),
  //     binding: ChooseLocationBinding()),
  // GetPage(
  //   name: Routes.aboutUsRoute,
  //   page: () => const AboutUsView(),
  // ),
  // GetPage(
  //   name: Routes.chooseMedicalNetworkView,
  //   page: () =>  ChooseMedicalNetworkView(),
  //   binding: ChooseProviderBinding()
  // ),
  // GetPage(
  //   name: Routes.medicalNetworkView,
  //   page: () =>   MedicalNetworkView(),
  //   binding: ChooseMedicalProviderBinding()
  // ),
];
