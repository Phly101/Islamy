// observable
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  static const String isDarkTheme ="theme";
  final SharedPreferences prefs;


  ThemeProvider( this.prefs) {
    readSavedTheme();

  }
  void readSavedTheme() async {
   var isDark = prefs.getBool(isDarkTheme)?? false;
   currentTheme = isDark? ThemeMode.dark : ThemeMode.light;

  }
  void saveTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkTheme, isDarkEnabled());
  }

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();

  }
  bool isDarkEnabled() => currentTheme == ThemeMode.dark;


}