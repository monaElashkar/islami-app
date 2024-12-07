import 'package:flutter_application_1/model/getdata.dart';

abstract class MyState {}
class InitialState extends MyState {
  
}
class LoudingState extends MyState {
  final bool enabled ;
  LoudingState({this.enabled = false});
}
class SuccessState extends MyState {
 List <GetData> data;
SuccessState({required this.data});
}
class FailureState extends MyState {
  final String error;
  FailureState({required this.error});
}