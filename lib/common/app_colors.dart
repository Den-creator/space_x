import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final shared = AppColors._();
  final _colors = DarkAppColors();

  Color get black => _colors.black;
  Color get almostBlack => _colors.almostBlack;
  Color get white => _colors.white;
  Color get red => _colors.red;
  Color get darkGrey => _colors.darkGrey;
  Color get blue => _colors.blue;
}

abstract class IAppColors {
  late Color black;
  late Color almostBlack;
  late Color darkGrey;
  late Color white;
  late Color red;
  late Color blue;
}

class DarkAppColors implements IAppColors {
  @override
  Color black = const Color(0xFF000000);

  @override
  Color almostBlack = const Color(0xFF0E0E0E);

  @override
  Color darkGrey = const Color(0xFF1B1B1B);

  @override
  Color white = const Color(0xFFFFFFFF);

  @override
  Color red = const Color(0xFFEC3A3A);

  @override
  Color blue = const Color(0xFF2D4EFF);
}
