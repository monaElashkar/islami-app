import 'dart:convert';
import 'package:flutter_application_1/model/getdata.dart';
import 'package:http/http.dart' as http;

class SourceData{
 static Future  getData()async{
       Uri url=Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=12');
   var response =await  http.get(url,);
   return response;
  }
}

