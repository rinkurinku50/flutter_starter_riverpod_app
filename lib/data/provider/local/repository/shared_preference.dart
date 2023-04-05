import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class SharedPrefs {
  final SharedPreferences _sharedPreferences;

  SharedPrefs(this._sharedPreferences);

  @factoryMethod
  static Future<SharedPrefs> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    CustomPrint.customPrint("shared prefs initialized");
    return SharedPrefs(sharedPreferences);
  }

  String read({required String key}) {
    try {
      return _sharedPreferences.getString(key) ?? "";
    } catch (exception, stacktrace) {
      CustomPrint.printException("shared pref", exception.toString(), stacktrace.toString());
      return "";
    }
  }

  Future<bool> write({required String key, required String value}) async {
    try {
      return await _sharedPreferences.setString(key, value);
    } catch (exception, stacktrace) {
      CustomPrint.printException("shared pref", exception.toString(), stacktrace.toString());
      return false;
    }
  }

  Future<bool> remove({required String key}) async {
    try {
      return await _sharedPreferences.remove(key);
    } catch (exception, stacktrace) {
      CustomPrint.printException("shared pref", exception.toString(), stacktrace.toString());
      return false;
    }
  }

  Future<bool> clear() async {
    try {
      return await _sharedPreferences.clear();
    } catch (exception, stacktrace) {
      CustomPrint.printException("shared pref", exception.toString(), stacktrace.toString());
      return false;
    }
  }
}
