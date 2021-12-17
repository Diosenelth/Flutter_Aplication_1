import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light_mode = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,

);

ThemeData dark_mode = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _preferences;
  bool _darkMode=true;

  bool get darkMode => _darkMode;
  
  ThemeNotifier() {
    _darkMode = true;
    _loadFromPreferences();
  }

  _initialPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  _savePreferences()async {
    await _initialPreferences();
    _preferences?.setBool(key, _darkMode);
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _darkMode = _preferences?.getBool(key) ?? true;
    notifyListeners();
  }

  toggleChangeTheme() {
    _darkMode = !_darkMode;
    _savePreferences();
    notifyListeners();
  }
  

}