import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A wrapper above [SharedPreferences] that will be initialized during getit init process
@singleton
class SharedWrapper {
  late SharedPreferences _prefs;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  String? getString(String key) => _prefs.getString(key);

  Future<void> remove(String key) => _prefs.remove(key);
}
