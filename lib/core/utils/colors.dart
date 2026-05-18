import 'package:flutter/cupertino.dart';

abstract class ColorsData {
  static final Color kPrimaryColor = const Color(0xff405AE4);
  static final Color kLightPrimaryColor = const Color(0xFFE8ECFF);
  static final Color kMediumPrimaryColor = const Color(0xFF4360F6);
  static final Color kNotReadyButtonColor = const Color(0xFFF2F4FC);
  static final Color kFontPrimaryColor = const Color(0xFF1F1F1F);
  static final Color kFontSecondaryColor = const Color(0xFF8C8B8B);
  static final Color kBorderColor = const Color(0xFFE9E8E8);
}

abstract class PieChartColorsData {
  static final Color systemPurple = const Color(0xFF9747FF);
  static final Color systemBlackRed = ColorsData.kMediumPrimaryColor;
  static final Color systemGreen = const Color(0xFF66DD96);
  static final Color systemYellow = const Color(0xFFD3DD66);
}
