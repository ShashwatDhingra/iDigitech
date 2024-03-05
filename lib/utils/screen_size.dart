import 'package:flutter/cupertino.dart';

class ScreenSize {
  static late double screenWidth;
  static late double screenHeight;
  static late bool isMobile;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    isMobile = MediaQuery.of(context).size.width < 700;
  }
}
