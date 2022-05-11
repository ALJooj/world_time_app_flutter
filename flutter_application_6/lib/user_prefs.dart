import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keyUsername = 'username';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String name) async =>
      await _preferences?.setString(_keyUsername, name);

  static String? getUsername() => _preferences?.getString(_keyUsername) ?? '';
}
