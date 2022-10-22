import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageViewContainer = screenHeight / 3.42;
  static double pageViewTextContainer = screenHeight / 6.27;
}
