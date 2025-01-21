import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:flutter/material.dart';

abstract class AppthemesManager{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.white,
      centerTitle: true
    )
  );
}