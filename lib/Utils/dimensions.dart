import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  //screen size used = 752

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.51;
  static double pageViewContainer = screenHeight / 3.42;
  static double pageViewTextContainer = screenHeight / 6.27;

  //dynamic height for padding and margin
  static double height10 = screenHeight / 75.2;
  static double height15 = screenHeight / 50.13;
  static double height20 = screenHeight / 37.6;
  static double height30 = screenHeight / 25.06;
  static double height45 = screenHeight / 16.71;

  //dynamic width for padding and margin
  static double width10 = screenHeight / 75.2;
  static double width15 = screenHeight / 50.13;
  static double width20 = screenHeight / 37.6;
  static double width30 = screenHeight / 25.06;
  static double width45 = screenHeight / 16.71;

  static double font20 = screenHeight / 37.6;

  //radius
  static double radius15 = screenHeight / 50.13;
  static double radius20 = screenHeight / 37.6;
  static double radius30 = screenHeight / 25.06;

  static double iconSize24 = screenHeight / 31.33;
}
