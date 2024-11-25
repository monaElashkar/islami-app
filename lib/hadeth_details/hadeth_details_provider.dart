import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/hadeth_model.dart';

class HadethDetailsProvider extends ChangeNotifier {
  List<HadethModel> ahadethData = [];
  HadethModel? hadethSelected;
  void selectHadethModel(int index){
    hadethSelected=ahadethData[index];
    // notifyListeners();
  }
  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((hadethFile){
      List <String> ahadeth=hadethFile.split("#");
      for(int i=0;i<ahadeth.length;i++){
        String hadeth=ahadeth[i];
        List<String> hadethLines=hadeth.split("\n");
        String title=hadethLines[0];
        hadethLines.removeAt(0);
        ahadethData.add(HadethModel(title:title,content:hadethLines  ));
      }
      notifyListeners();
    });
    // .then((hadethFile) {
    //   List<String> ahadeth = hadethFile.split("#");

    //   for (int i = 0; i < ahadeth.length; i++) {
    //     String hadeth = ahadeth[i];
    //     List<String> hadethLines = hadeth.trim().split("\n");
    //     String title = hadethLines[0];
    //     hadethLines.removeAt(0);
    //     List<String> hadethContent = hadethLines;
    //     print(title);
    //     ahadethData.add(HadethModel(title: title, content: hadethContent));
    //   }
    //   notifyListeners();
    // });
  }
}
