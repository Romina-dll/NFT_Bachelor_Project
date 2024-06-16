import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/Intro/view.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/home/view.dart';

class RoutePages {
 static final pages = [
   GetPage(
       name: IntroScreen.name,
       page: () => IntroScreen()
   ),
   GetPage(
       name: HomeScreen.name,
       page: () => HomeScreen()
   ),
 ];
}