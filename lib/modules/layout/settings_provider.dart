import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme= ThemeMode.light;
  String currentLanguage="en";

  final List<String> _LanguageList=[
    "English",
    "عربي"
  ];
  final List<String> _ThemeList=[
    "Light",
    "Dark"
  ];


  List<String> get LanguageList=> _LanguageList;

  List<String> get ThemeList=> _ThemeList;

  void setCurrentLanguage(String newLanguage){
    if(currentLanguage==newLanguage) return;
    currentLanguage=newLanguage;

    notifyListeners();
  }
  void setCurrentTheme(ThemeMode newTheme){
    if(newTheme==currentTheme) return;
    currentTheme=newTheme;

    notifyListeners();
  }
  bool isDark(){
    return currentTheme==ThemeMode.dark;
  }

}