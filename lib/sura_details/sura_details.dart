import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/sura_details/sura_details_provider.dart';
import 'package:provider/provider.dart';

import '../models/sura_model.dart';
import '../providers/my_provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "SuraDetailsScreen";

  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build SuraDetailsScreen" );
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;

    var pro=Provider.of<MyProvider>(context);
    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context) => SuraDetailsProvider()..loadFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        // if(provider.verses.isEmpty){
        //   provider.loadFile(model.index);
        // }

        return Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pro.getBackgroundPath()),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                model.name,
              ),
            ),
            body: Card(
              margin: const EdgeInsets.all(12),
              elevation: 12,
              color: Colors.white.withOpacity(.7),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.transparent)),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemBuilder: (context, index) {
                  return Text(
                    provider.verses[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
                itemCount: provider.verses.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
