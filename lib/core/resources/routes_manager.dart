// import 'package:elnilein/presentation/view/main/main_view.dart';
// import 'package:elnilein/presentation/view/splash_view.dart';
// import 'package:get/get.dart';
// import '../controller/choose_location/choose_location_binding.dart';
// import '../controller/choose_medical_provider/choose_medical_provider_binding.dart';
// import '../controller/choose_provider/choose_provider_binding.dart';
// import '../controller/contact_us/contact_us_binding.dart';
// import '../controller/main/main_binding.dart';
// import '../controller/our_branch/our_branch_binding.dart';
// import '../controller/our_products/our_products_binding.dart';
// import '../controller/splash/splash_binding.dart';
// import '../view/about_us/about_us_view.dart';
// import '../view/choose_location_view/choose_state_view.dart';
// import '../view/contact_us/contact_us_view.dart';
// import '../view/medical_network/choose_medical_network_view.dart';
// import '../view/medical_network/medical_network_view.dart';
// import '../view/our_branch/our_branch_view.dart';
// import '../view/our_products/our_products_view.dart';

import 'package:get/get.dart';
import 'package:hafiza/features/main/presentation/controller/home/home_binding.dart';
import 'package:hafiza/features/main/presentation/screens/home/home.dart';

import '../../features/introduction/presentation/controller/splash/splash_binding.dart';
import '../../features/introduction/presentation/screens/splash/splash_view.dart';
import '../../features/main/presentation/controller/main/main_binding.dart';
import '../../features/main/presentation/screens/main/main_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String mainRoute = "/main";
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
