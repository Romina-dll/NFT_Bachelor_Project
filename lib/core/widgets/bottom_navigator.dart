import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/app.dart';
import 'package:userinterface_nft_bachelar_finalproject/core/values/colors.dart';

class DotNavigationBarItem {
  final Widget icon;
  final Color? selectedColor;
  final Color? unselectedColor;

  DotNavigationBarItem({
    required this.icon,
    this.selectedColor,
    this.unselectedColor
  });
}


class DotNavigationBar extends StatelessWidget{
  final List<DotNavigationBarItem> items;
  final int currentIndex;
  DotNavigationBar({
    super.key,
    required this.currentIndex,
    required this.items
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      height: appSize.getHeight(heightSize: 65),
      color: AppColors.background,
      child:  Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for(final item in items)
                TweenAnimationBuilder<double>(
                    tween: Tween(
                      end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                    ),
                    duration: Duration(milliseconds: 100),
                    builder: (context , t , _){
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Stack(children: <Widget>[
                            Padding(padding: EdgeInsets.only(right: 10),
                              child:Row(
                                children: [
                                  IconTheme(
                                      data: IconThemeData(
                                          color:
                                          Color.lerp(AppColors.gray.withOpacity(0.7),
                                              AppColors.primaryColor, t),
                                        size: 35
                                      ),
                                      child: item.icon
                                  )
                                ],
                              )
                            ),
                          ],),
                        ),
                      );
                    }
                )
            ],
          ),
        ),
      ),
    );
  }
}