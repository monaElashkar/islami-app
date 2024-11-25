import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String? name;
  saveData()async{
  SharedPreferences prefrence=await SharedPreferences.getInstance();
  prefrence.setString("name", "Rahul");

  }
  getDate()async{
      SharedPreferences p=await SharedPreferences.getInstance();
      setState(() {
        name=  p.getString("name");
      });
  }
  removeData()async{
    SharedPreferences shared=await SharedPreferences.getInstance();
   var s= shared.remove("name");
    print("/////////////////////////////////////$s");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$name",style: const TextStyle(fontSize: 30),),
          ElevatedButton(onPressed: saveData, child: Text("Save Data")),
          ElevatedButton(onPressed: getDate, child: Text("Get Data")),
          ElevatedButton(onPressed:removeData, child: Text("remove Data")),
        ],
      )),
    );
  }
}