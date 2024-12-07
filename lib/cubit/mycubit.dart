
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/cubit/mystate.dart';
import 'package:flutter_application_1/data/getdataremote.dart';
import 'package:flutter_application_1/model/getdata.dart';

class MyCubit extends Cubit <MyState>{
  MyCubit():super(InitialState());
   Future getDataRemote()async{
    emit(LoudingState(enabled: true));
    var response = await SourceData.getData();
    var resposeBody=jsonDecode(response.body) ;

    emit(LoudingState(enabled: false));
    if(response.statusCode==200){
     List <GetData> res=[];
    for(int i=0;i<resposeBody.length;i++){
      res.add(GetData.fromJson(resposeBody[i]));
    }
    emit(SuccessState(data: res));
    }else{
    emit(FailureState(error:  ""));
    }

  
  }
  
}