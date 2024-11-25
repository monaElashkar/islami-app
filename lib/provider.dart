import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/my_theme.dart';

class IcrimanteProvider with ChangeNotifier{
    int counter1 = 0;
    int counter2 = 0;

   get showCounter1=>counter1;

   incrementCounter1() {
      counter1++;
      notifyListeners();
  }

  
   get showCounter2=>counter2;

   incrementCounter2() {
      counter2++;
      notifyListeners();
  }

      int counter3 = 0;

   get showCounter3=>counter3;

   incrementCounter3() {
      counter3++;
      notifyListeners();
  }

  ThemeData themeMode = MyTheme.ligth;
  changeTheme(){
    if(themeMode == MyTheme.ligth){
      themeMode = MyTheme.dark;
    }else{
      themeMode = MyTheme.ligth;
    }
    notifyListeners();
  }
}

 