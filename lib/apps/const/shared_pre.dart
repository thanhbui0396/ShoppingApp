import 'package:shared_preferences/shared_preferences.dart';

class SharedCustom {
  static void saveIsLogin(String key, bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, isLogin);
  }

  static getsIsLogin(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool action = prefs.getBool(key) ?? false;
    bool data = action;
    return data;
  }

  // static void saveIntro(String key, bool isIntro) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool(key, isIntro);
  // }

  // static getsIntro(String key) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool action = prefs.getBool(key) ?? false;
  //   bool data = action;
  //   return data;
  // }
  static void saveIntro(String key, int num) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, num);
  }

  static getsIntro(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int action = prefs.getInt(key) ?? 0;
    int data = action;
    return data;
  }
}
