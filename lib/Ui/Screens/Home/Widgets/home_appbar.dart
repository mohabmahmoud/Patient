import 'package:flutter/material.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Constants/paths.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';

import '../../../SharedWidgets/SizedBoxes.dart';

AppBar homeAppBar(){
  return AppBar(elevation: 5,centerTitle: false,
    title: appText(text:appDic["Book an Appointment Now"],
      style: AppStyle.h0BlackBold.copyWith(height: 2.5),),
    actions: [


      sizedWS(),
      InkWell(onTap: (){

      },child:
      Container(margin: EdgeInsets.only(top:Helper.outerPadding/2 ,bottom:Helper.outerPadding/2 ,right: Helper.outerPadding/4,left:Helper.outerPadding/4 ),width: 45,height: 45,decoration: MainBoxDecorationStyle(AppStyle.shadowColor, 4),child:
      Padding(
          padding: EdgeInsets.only(right: Helper.outerPadding*1.3,left:Helper.outerPadding*1.3 ),
          child: Image.asset(notificationImage,color: AppStyle.black,fit: BoxFit.fitWidth,width: Helper.iconM,height: Helper.iconM,)),
      )


      ),
      InkWell(onTap: (){

      },child:
      Container(margin: EdgeInsets.only(top:Helper.outerPadding/2 ,bottom:Helper.outerPadding/2 ,right: Helper.outerPadding/4,left:Helper.outerPadding/4 ),width: 45,height: 45,decoration: MainBoxDecorationStyle(AppStyle.shadowColor, 4),child:
      Padding(
          padding: EdgeInsets.only(right: Helper.outerPadding*1.3,left:Helper.outerPadding*1.3 ),
          child:

          Image.asset(searchBoldImage,color: AppStyle.black,fit: BoxFit.fitWidth,width: Helper.iconM,height: Helper.iconM,)),
      )


      ),
      sizedWS()

    ],
  );

}