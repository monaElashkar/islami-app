import 'package:flutter/material.dart';
import 'package:flutter_application_1/hadeth_details/hadeth_details_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HadethDetailsProvider>(context);   
     return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${provider.hadethSelected?.title}"),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .6, //  400
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            alignment: Alignment.center,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  provider.hadethSelected?.content[index]??"",
                  textAlign: TextAlign.center,
                );
              },
              itemCount: provider.hadethSelected?.content.length??0,
            ),
          ),
        ),
      ),
    );
  }
}
