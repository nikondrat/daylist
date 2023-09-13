import 'dart:convert';

import 'package:daylist/data/storage/model/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  late final Future<SharedPreferences> _prefs;
  static const String _settingsKey = 'settings';
  static const String _authKey = 'isAuthorized';

  SharedPrefsService() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<bool> isAuthorized() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.containsKey(_authKey)) {
      final bool? data = prefs.getBool(_authKey);
      if (data != null) return data;
    }

    return false;
  }

  Future setIsAuthorized(bool value) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setBool(_authKey, value);
  }

  Future<Settings?> getSettings() async {
    final SharedPreferences prefs = await _prefs;

    if (prefs.containsKey(_settingsKey)) {
      final String? data = prefs.getString(_settingsKey);
      if (data != null) return Settings.fromMap(jsonDecode(data));
    }

    return null;
  }

  Future setSettings(Settings settings) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString(_settingsKey, jsonEncode(settings.toMap()));
  }
}
