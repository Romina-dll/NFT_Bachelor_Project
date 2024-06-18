import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/home/view.dart';

enum SelectedTab { home ,
 // profile , create , bag
}

class LandingController extends GetxController {
  static LandingController get to => Get.find<LandingController>();

  Rx<SelectedTab> selectedTab = Rx<SelectedTab>(SelectedTab.home);

  void handleIndexChanged(int i) {
    selectedTab.value = SelectedTab.values[i];
  }

  Widget currentChild(){
    switch (selectedTab.value) {
      case SelectedTab.home :
        return  HomeScreen();
      // case SelectedTab.bag :
      //   return Container(height: 100,width: 100 , color: Colors.blue,);
      // case SelectedTab.create:
      //   return Container(height: 300,width: 300 , color: Colors.blue,);
      // case SelectedTab.profile:
      //   return SizedBox();

    }
  }
}