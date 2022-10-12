import 'dart:core';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:patient/Core/Helper/Helper.dart';
import '../../Style/AppStyle.dart';
import 'AppText.dart';
import 'InputField.dart';



  Widget appDatePicker({required Function(DateTime?) onChange,
  Widget ?preFix,
  String ?hint="",
  DateTime ?val}) {
    return

      Material(
          borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius))

          ,elevation: 1,child:

      SizedBox(
      height: Helper.itemsHeight,
        child:InputDecorator(

        decoration: InputDecoration(
            filled: true,
            fillColor: AppStyle.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 24.0),
            isCollapsed: true,





    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
    borderSide: BorderSide(color: AppStyle.primaryColor.withOpacity(0.15)),
    ),


            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
              borderSide: BorderSide(color: AppStyle.primaryColor),
            ),
            hintText: hint,
            hintStyle: AppStyle.h4GreySemiBold,
            // ignore: prefer_if_null_operators
            prefixIcon:preFix??Container()
        )


            ,child: InkWell(child:appText(text:(val!=null)?Helper.dateTimeHelper.dateToString(val):hint!,style: (val!=null)?AppStyle.h2BlackLight:AppStyle.h2GreyLight,),onTap: ()async{
    final DateTime? picked = await showDatePicker(
    context: Helper.materialKey.currentContext!,
       initialDatePickerMode: DatePickerMode.year,
    initialDate: val??DateTime.now(),
    firstDate: DateTime(1900, 8),
    lastDate: DateTime.now());
    if (picked != null && picked != val) {
       onChange(picked);}
        })
        )




    ));
  }


