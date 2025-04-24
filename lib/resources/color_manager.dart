import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();
  //********* primary color  *********//
  static const Color blueColor = Color(0xFF0A8798);
  static const Color lightBlueColor = Color(0xFFC5E9ED);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const Color veryDarkGrayColor = Color(0xFF292D32);
  static const Color darkGrayColor = Color(0xFF606060);
  static const Color grayColor = Color(0xFF717171);
  static const Color lightGrayColor = Color(0xFFA2A7AF);
  static const Color veryLightGrayColor = Color(0xFFEEEEEE);

  static const Color otherRed2 = Color(0xFFE54242);
  static const Color otherLightRed = Color(0xFFE72626);
  static const Color otherGreen = Color(0xFF00C314);

  static const Color backgroundColor = Color(0xFFF7F7F7);

  //********* secondary linear gradient color  *********//
  static LinearGradient gradientSecondary500 = LinearGradient(
    colors: [
      const Color(0xFF4DC6C3).withOpacity(0.15),
      const Color(0xFF5268A9).withOpacity(0.15),
    ],
    begin: const Alignment(-0.015, -1),
    end: const Alignment(0.0015, 1),
  );
}
