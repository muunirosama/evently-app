// import 'package:shared_preferences/shared_preferences.dart';
//
// abstract class LocalStorageServices{
//  static late SharedPreferences preferences;
//  static init()async{
//    preferences=await SharedPreferences.getInstance();
//  }
//  static Future<bool> setString(String key, String value)async{
//    return await preferences.setString(key, value);
//  }
//  static Future<bool> setList(String key, List<String> values)async{
//    return await preferences.setStringList(key, values);
//  }
//  static Future<bool> setInt(String key, int value)async{
//    return await preferences.setInt(key, value);
//  }
//  static  Future<bool> setBool(String key, bool value)async{
//    return await preferences.setBool(key, value);
//  }
//  static  bool? getBool(String key) {
//    return preferences.getBool(key);
//  }
//  static  int? getInt(String key) {
//    return preferences.getInt(key);
//  }
//  static  String? getString(String key) {
//    return preferences.getString(key);
//  }
//  static List<String>? getStringList(String key) {
//    return preferences.getStringList(key);
//  }
//  static Future<bool>remove(String key)async{
//    return await preferences.remove(key);
//  }
// }