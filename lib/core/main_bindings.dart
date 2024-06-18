import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/controllers/main_controller.dart';

class AppMainBindings extends Bindings{

  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }

  static Future<void> setup() async {
    AppMainBindings().dependencies();
  }


}