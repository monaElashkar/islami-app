import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future saveData({required String key, dynamic value}) async {
    if (value is String) {
      await sharedPreferences?.setString(key, value);
    }
    if (value is int) {
      await sharedPreferences?.setInt(key, value);
    }
    if (value is double) {
      await sharedPreferences?.setDouble(key, value);
    }
    if (value is bool) {
      await sharedPreferences?.setBool(key, value);
    }
  }

  // remove data from SharedPreferences
  static Future removeData({required String key}) async {
    await sharedPreferences?.remove(key);
  }

  /// Get data from SharedPreferences
  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }
}