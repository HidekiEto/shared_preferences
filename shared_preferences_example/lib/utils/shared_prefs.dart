import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _isLoggedInKey = 'isLoggeIn';

  static Future<void> setLoginStatus(bool isLoggeIn) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, isLoggeIn);
  }

  // recupera o estado de login do shared_prefences
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ??
      false; // retorna se não estiver definido
  }

  //remove o estado de login do SharedPreferences
    static Future<void> removeLoginStatus() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_isLoggedInKey);
    }
}