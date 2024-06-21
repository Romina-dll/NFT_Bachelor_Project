import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/app.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/widgets/bottom_navigator.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/landing/controller.dart';

class LandingScreen extends StatelessWidget{
  static const name = '/landing';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      bottomNavigationBar: GetX<LandingController>(
        builder: (c) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: appSize.getWidth(widthSize: 0)),
            child:  DotNavigationBar(
              onTap: LandingController.to.handleIndexChanged,
                currentIndex: SelectedTab.values.indexOf(LandingController.to.selectedTab.value),
                // currentIndex: 0,
                items: [
                  DotNavigationBarItem(icon: Icon(Icons.home)),
                  DotNavigationBarItem(icon: Icon(Icons.create_outlined)),
                  DotNavigationBarItem(icon: Icon(Icons.shopping_cart)),
                  DotNavigationBarItem(icon: Icon(Icons.person)),
                ],

              )

          );
        }
      ),
        body: GetX<LandingController>(
        builder: (controller) => controller.currentChild()

        )
    );
  }
}