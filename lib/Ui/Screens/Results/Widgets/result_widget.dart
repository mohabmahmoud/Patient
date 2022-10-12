 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Data/Models/Results/patient_results.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/Loading/AppWebView.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';

Widget resultWidget(PatientResults result,int laborRadOrRx){
   return Container(decoration: MainBoxDecorationStyle(AppStyle.shadowColor, 2),padding: EdgeInsets.all(Helper.outerPadding/2),margin: EdgeInsets.all(Helper.outerPadding),child:
   Column(children: [
     sizedS(),
     Row(children: [
       Flexible(flex: 3,child: appText(text: "اسم الخدمة: ", style:AppStyle.h4GreySemiBold)),
       Flexible(flex: 5,child:appText(text: result.serviceName, style:AppStyle.h4BlackSemiBold)),
     ],),
     Row(children: [

       Flexible(flex: 3,child:appText(text: "الطبيب المنفذ: ", style:AppStyle.h4GreySemiBold)),
       Flexible(flex: 5,child:appText(text: result.doneDoctorName, style:AppStyle.h4PrimarySemiBold)),


     ],),
     Row(children: [

       Flexible(flex: 3,child:appText(text: "تاريخ النتيجة: ", style:AppStyle.h4GreySemiBold)),
       Flexible(flex: 5,child:appNumber(text: result.resultDate.toString(), style:AppStyle.h4BlackSemiBold)),


     ],),
     const Divider(),
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

       Flexible(flex: 1,child:AppButton(height: 50,color: AppStyle.green,textColor: AppStyle.white,onPressed: (){

         if(laborRadOrRx==1){
           Get.to(AppWebView(action:"Medical/LabWorkV2/PrintRegularDeliveredLabResult?LabOrderVisitServiceId=${result.id}"));


         }else if(laborRadOrRx==1){

           Get.to(AppWebView(action:"Medical/RadiologyListManagementV2/PrintReport?VisitServiceId=${result.id}"));


         }
         else{
           Get.to(AppWebView(action:
           "Admin/Rx/PrintReport?RxId=${result.id}"));

         }

       },text: "عرض النتيجة",textStyle:AppStyle.h4BlackSemiBold,)),
       sizedWS(),
       Flexible(flex: 1,child:AppButton(height: 50,color: AppStyle.accentColors,textColor: AppStyle.black,onPressed: (){


       },text: "مشاركة",textStyle:AppStyle.h4WhiteSemiBold,)),

     ],),


   ],)

     ,);

 }