import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState{SUCCESS, ERROR, WARNING}

Color showToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;

    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}




void showErrorToast(context,{
  required String msg,
  int time = 5,
  double fontSize = 18.0,
  ToastGravity gravity = ToastGravity.TOP,

}) =>  Fluttertoast.showToast(
  msg: msg,
  fontSize: fontSize.sp,
  timeInSecForIosWeb: time,
  gravity: gravity,
  backgroundColor: Colors.red,
);