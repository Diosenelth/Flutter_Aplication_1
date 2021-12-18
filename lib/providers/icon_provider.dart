// ignore_for_file: prefer_final_fields


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IconDarkTheme with ChangeNotifier {
  SharedPreferences? preferences;
  final _icons = <String, IconData>{
    'sunny': Icons.wb_sunny,
    'dark': Icons.dark_mode,
  };

  Icon _icond = const Icon(Icons.wb_sunny);
  Brightness _brightness = Brightness.light;

  final String _icondark = "dark";
  final String _iconsunny = "sunny";
  String _icon = "sunny";

  Icon get icon{
    obtener();
    return _icond;
    }
    
  get brightness {
    icon;
    return _brightness;
  }

  seticon() {
    if (_icon == _iconsunny) {
      dark();
    } else {
      light();
    }
  }

  dark(){
    _icon = _icondark;
    _icond = Icon(_icons[_icondark]);
    _change(_icon);
    bright();
  }

  light(){
    _icon = _iconsunny;
    _icond = Icon(_icons[_iconsunny]);
    _change(_icon); 
    bright();
  }

  bright(){
    _brightness = (_icon == _iconsunny) ? Brightness.light : Brightness.dark;
    notifyListeners();
  }

  obtener() async {
    preferences=await SharedPreferences.getInstance();
    _icon=preferences?.getString("color")??("sunny");
    if (_icon == _iconsunny) {
      light();
    } else {
      dark();
    }
  }

  void _change(String color) async{
    final SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("color", color);
  }
  
}