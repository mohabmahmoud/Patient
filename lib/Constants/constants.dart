// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_declarations, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patient/Style/AppStyle.dart';
import '../Core/Helper/Helper.dart';
import '../Core/Language/LangVariables.dart';
import 'color.dart';

Color PrimaryColor =HexColor('#2B4170');
final BlueColor = Colors.blue;
final GreenColor = HexColor('#38a73f');











BoxDecoration MainBoxDecorationStyle(Color Clr,int BorderCount) => BoxDecoration(
      color: Clr,
      borderRadius: BorderRadius.circular(Helper.borderRadius* BorderCount),
    );
BoxDecoration MainOutLineBoxDecorationStyle(Color Clr,int BorderCount,Color ?color) => BoxDecoration(
  border: Border.all(color:Clr ,width: 1),
  color: color??Colors.transparent,
  borderRadius: BorderRadius.circular(Helper.borderRadius*BorderCount ),
);


BoxDecoration MainBoxDecorationStyleByLang(Color Clr) => BoxDecoration(
    color: Clr,
    borderRadius: direction==TextDirection.rtl
        ? BorderRadius.only(
            topRight: Radius.circular(Helper.borderRadius * 1.5),
            bottomRight: Radius.circular(Helper.borderRadius * 1.5))
        : BorderRadius.only(
            topLeft: Radius.circular(Helper.borderRadius * 1.5),
            bottomLeft: Radius.circular(Helper.borderRadius * 1.5)));
