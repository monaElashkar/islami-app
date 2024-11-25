import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/my_provider.dart';
import 'package:provider/provider.dart';

class CustomBakeground extends StatelessWidget {
  Widget child;
   CustomBakeground({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
     var provider=Provider.of<MyProvider>(context);
    return  Stack(
      children: [
        Image.asset(
          provider.getBackgroundPath(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        child,
      ],
    );
  }
}