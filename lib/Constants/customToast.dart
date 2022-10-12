
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Style/AppStyle.dart';
import 'constants.dart';

void showSuccessToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: GreenColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showFailedToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppStyle.red,
      textColor: AppStyle.white,
      fontSize: 16.0);
}
