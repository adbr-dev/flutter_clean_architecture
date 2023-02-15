import 'package:flutter/material.dart';

class UtilColors {
  UtilColors._();

  static const MaterialColor main = MaterialColor(
    _mainPrimaryValue,
    <int, Color>{
      50: Color(_mainPrimaryValue),
      100: Color(_mainPrimaryValue),
      200: Color(_mainPrimaryValue),
      500: Color(_mainPrimaryValue),
      600: Color(_mainPrimaryValue),
      700: Color(_mainPrimaryValue),
    },
  );
  static const int _mainPrimaryValue = 0xFF0265e6;

  static const Color background = Color(0xFFf8f8f8);
}
