import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/app.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/colors.dart';
import 'package:userinterface_nft_bachelar_finalproject/modules/landing/view.dart';

class IntroScreen extends StatelessWidget{
  IntroScreen({super.key});

  static const name = '/';

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appSize.getWidth(widthSize: 20),
            vertical: appSize.getHeight(heightSize: 10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset("assets/intro.png" ),
              Spacer(),
              Text("Find Your Favorite NFT" , style: TextStyle(
                color: AppColors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              Text("Digital Art" , style: TextStyle(
                  color: AppColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: appSize.getHeight(heightSize: 10),),
              Text('The Best NFT market Platform',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                ),
              ),
              Spacer(flex: 2,),
              InkWell(
                onTap: (){
                  Get.toNamed(LandingScreen.name);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: appSize.getHeight(heightSize: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColors.primaryColor
                  ),
                  child: Text('Continue' , style: TextStyle(
                      color: AppColors.background,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                ),
              ),
              Spacer()
            ],
          ),
        )
      ),
    );
  }
}