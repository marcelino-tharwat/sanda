import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;
  static const storage = FlutterSecureStorage();

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setData({required String key, required dynamic value}) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      throw ArgumentError("Unsupported type for SharedPreferences");
    }
  }

  String? getString({required String key}) {
    return prefs.getString(key);
  }

  int? getInt({required String key}) {
    return prefs.getInt(key);
  }

  bool? getBool({required String key}) {
    return prefs.getBool(key);
  }

  double? getDouble({required String key}) {
    return prefs.getDouble(key);
  }

  Future<void> removeData({required String key}) async {
    await prefs.remove(key);
  }

  Future<void> clearAllData() async {
    await prefs.clear();
  }

  Future<void> setSecureData(
      {required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getSecureData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> deletSecureData({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> clearAllSecureData() async {
    await storage.deleteAll();
  }
}
