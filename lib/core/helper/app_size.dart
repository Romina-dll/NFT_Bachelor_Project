import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// this is a class for add double value that use in all the app.
class _AppSizeValue {
  static const screenWidth = 412.0;
  static const screenHeight = 860.0;
  static const mainRoadMapHeight = 5010.0;
//static const horizontalPadding = 16.0;
//static const verticalPadding = 8.0;
}

/// this is a class for get size & padding that use in all the app.
class AppSize {
  /// singleton pattern
  static AppSize? _instance;

  BuildContext? _context;

  AppSize._internal(this._context);

  factory AppSize(BuildContext context) {
    _instance ??= AppSize._internal(context);
    return _instance!;
  }

  BuildContext get context => _context!;

  /// for specify the width
  double getWidth({
    required double widthSize,
  }) {
    final coefficientMainWidth = _AppSizeValue.screenWidth / widthSize;
    var width = MediaQuery.of(context).size.width / coefficientMainWidth;
    return width;
  }

  /// for specify the height
  double getHeight({
    required double heightSize,
  }) {
    final statusBarHeight = Get.statusBarHeight + Get.bottomBarHeight;
    final coefficientMainHeight = _AppSizeValue.screenHeight / heightSize;
    final height =
        (MediaQuery.of(context).size.height - (statusBarHeight / 3.1)) /
            coefficientMainHeight;
    return height;
  }

  /// for specify the image Size
  double getRoadMapImageHeight() {
    double phoneWidth = MediaQuery.of(context).size.width;

    double coefficientWidth = _AppSizeValue.screenWidth > phoneWidth
        ? _AppSizeValue.screenWidth - phoneWidth
        : phoneWidth - _AppSizeValue.screenWidth;

    double imageHeight = _AppSizeValue.screenWidth > phoneWidth
        ? _AppSizeValue.mainRoadMapHeight + (coefficientWidth * 24)
        : _AppSizeValue.mainRoadMapHeight - (coefficientWidth * 24);

    return imageHeight;
  }

  /// for specify the width
  double circleSize({
    required double size,
  }) {
    final coefficientMainWidth = _AppSizeValue.screenWidth / size;
    final coefficientMainHeight = _AppSizeValue.screenHeight / size;
    final statusBarHeight = Get.statusBarHeight + Get.bottomBarHeight;
    var width = MediaQuery.of(context).size.width / coefficientMainWidth;
    final height =
        (MediaQuery.of(context).size.height - (statusBarHeight / 3.1)) /
            coefficientMainHeight;
    return (width + height) / 2;
  }
}
