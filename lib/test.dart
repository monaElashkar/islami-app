import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/mycubit.dart';
import 'package:flutter_application_1/cubit/mystate.dart';
import 'package:flutter_application_1/model/getdata.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Test extends StatelessWidget {
  const Test({super.key});

  // get =>future   parametar =>
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit()..getDataRemote(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener(
              listener:(context, state){
                
              },
            ),
          
            BlocBuilder<MyCubit,MyState>(
                
                builder: (context, state) {
                  if (state is FailureState) {
                    return Text(state.error);
                  } else if (state is SuccessState) {
               
                    if(state.data.isEmpty){
                      return Text("No data");
                    }
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.data.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  "Name : ${state.data[index].name}",
                                  style: TextStyle(fontSize: 20),
                                );
                              }),
                        ),

                      ],
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  }
                }),

            // ElevatedButton(onPressed: saveData, child: Text("Save Data")),
            // ElevatedButton(onPressed: getDate, child: Text("Get Data")),
            // ElevatedButton(onPressed:removeData, child: Text("remove Data")),
          ],
        )),
      ),
    );
  }
}

// class GetDate{
//   int? postId;
//   int? id;
//   String? name;
//   String? email;
//   String? body;
//   GetDate({required this.postId,
//   required this.id,required this.name,required this.email,required this.body});

//  GetDate.fromJson(Map<String,dynamic> json){
//    postId=json["postId"];
//    id=json["id"];
//    name=json["name"];
//    email=json["email"];
//    body=json["body"];
//  }
// Map<String,dynamic> toJson(){

//    return{
//      "postId": postId,
//      "id": id,
//      "name": name,
//      "email": email,
//      "body": body,
//    };
//  }
// }

//list[index]["name"]
//list[index].id
// class Source{
//   GetDate? source;
//   Source({required this.source});
//   Source.fromJson(Map<String,dynamic> json){

//     source=GetDate.fromJson(json["source"]);
//     }
// }
