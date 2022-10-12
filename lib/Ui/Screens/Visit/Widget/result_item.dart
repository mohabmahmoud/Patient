import 'package:flutter/material.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';

Widget resultItem({required String title,required String image,required Function onTap}){

  return Flexible(flex: 1,child: SizedBox(width: Helper.sW/3,child:

  Card(elevation: .7,child:
  InkWell(child:
  Column(children: [
    sizedS(),
    Padding(padding:EdgeInsets.symmetric(horizontal:Helper.outerPadding*2) ,child:Image.asset(image,color: AppStyle.accentColors,)),
    const Divider(),
    appText(text: title, style:AppStyle.h3BlackSemiBold),
    sizedM(),




  ],),onTap:(){

    onTap();

  },)


  ),




  ));

}