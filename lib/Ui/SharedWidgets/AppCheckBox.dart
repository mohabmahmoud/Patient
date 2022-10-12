import 'package:flutter/material.dart';
import 'package:patient/Style/AppStyle.dart';
import 'AppText.dart';


appCheckBox({required String text,required TextStyle style,required bool value,

  required Function(bool?) onChange}){
  return

    Row(children: [
      Checkbox(activeColor: AppStyle.accentColors,value: value, onChanged:onChange ),
      appText(text:text,style:style,),

    ],);


}