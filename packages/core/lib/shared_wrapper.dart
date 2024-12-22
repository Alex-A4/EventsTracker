import 'package:shared_preferences/shared_preferences.dart';

/// A wrapper above [SharedPreferences] that will be initialized during getit init process
class SharedWrapper {
  final SharedPreferences _prefs;
  SharedWrapper._(this._prefs);

  static Future<SharedWrapper> init() async {
    return SharedWrapper._(await SharedPreferences.getInstance());
  }

  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  String? getString(String key) => _prefs.getString(key);

  Future<void> remove(String key) => _prefs.remove(key);
}
