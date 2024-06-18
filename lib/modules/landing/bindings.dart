import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/home/view.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/landing/controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies () {
    Get.put<LandingController>(LandingController());
    Get.put<HomeScreen>(HomeScreen());
  }
}