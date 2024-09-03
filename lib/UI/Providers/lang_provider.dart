// observable
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangProvider extends ChangeNotifier {
  String currentLocale =  "en";
  static const String langKey ="lang";
  final SharedPreferences prefs;

  LangProvider(this.prefs){
    readSavedLocale();
  }
  void readSavedLocale() async {

    currentLocale = prefs.getString(langKey) ?? "en";
  }

  void saveLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(langKey, currentLocale);
  }



  void changeLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
    saveLocale();

  }




}