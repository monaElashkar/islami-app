import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Widget child;
  const MyWidget({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset("name"),
        ),
        child,
    ],
    );
  ;
  }
}