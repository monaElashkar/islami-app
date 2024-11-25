import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/cach_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant/cach_keys.dart';
class MyProvider extends ChangeNotifier {
  String languageCode="ar" ;
  ThemeMode themeMode=ThemeMode.light;

  void changeLanguage(String langCode) {
    languageCode = langCode;
    saveLanguage(langCode);
     print(langCode);
    notifyListeners();
  }

  void changeTheme(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
  }

  saveLanguage(String langCode) async {
    CacheHelper.saveData(key:CachKeys.languageCodeKey,value: langCode);
    notifyListeners();
  }

  getLanguage()async{
    SharedPreferences shared=await SharedPreferences.getInstance();
    return shared.getString(CachKeys.languageCodeKey);
    print(languageCode);
    notifyListeners();
  }

  String getBackgroundPath(){
    if(themeMode==ThemeMode.light){
      return  "assets/images/background.png";
    }else{
      return  "assets/images/dark_bg.png";
    }

  }
}
