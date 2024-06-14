import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/Intro/view.dart';

class RoutePages {
 static final pages = [
   GetPage(
       name: IntroScreen.name,
       page: () => IntroScreen()
   ),
 ];
}