import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/config/language/Local_Key.g.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${LocalKeys.quran.tr()}${index+1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    notifyListeners();
  }
}
