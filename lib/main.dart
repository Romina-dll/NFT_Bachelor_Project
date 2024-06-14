import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/helper/app_size.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/routes.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/app.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/Intro/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context , child) {
        return Builder(builder: (context) {
          appSize = AppSize(context);
          return OKToast(
            //textPadding: EdgeInsets.all(8),
            animationCurve: Curves.easeIn,
            animationDuration: Duration(milliseconds: 400),
            duration: Duration(seconds: 2),
            child: child!,
          );
        }
        );
      },
      defaultTransition: Transition.fadeIn,
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.name,
      getPages: RoutePages.pages,
    );
  }
}
