import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:flutter/material.dart';

abstract class AppThemesManager{
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.primaryColor,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        selectedItemColor: ColorPalette.white,
        unselectedItemColor: ColorPalette.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
  )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xff101127),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorPalette.primaryColor,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    selectedItemColor: ColorPalette.white,
    unselectedItemColor: ColorPalette.white,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  )
  );
}