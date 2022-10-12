import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Data/Models/Visit/patient_app_visit_model.dart';
import 'package:patient/Style/AppStyle.dart';
import '../../../../Core/Helper/Helper.dart';
import '../../../SharedWidgets/AppButton.dart';
import '../../../SharedWidgets/AppNumber.dart';
import '../../../SharedWidgets/AppText.dart';
import '../../../SharedWidgets/SizedBoxes.dart';
import '../../Visit/VisitScreen.dart';

Widget visitItem({required PatientAppVisitModel visit,bool ?showBtn}){

  return Padding(padding: EdgeInsets.all(Helper.outerPadding),child:Material(
    color: AppStyle.white,
    borderRadius: BorderRadius.circular(Helper.borderRadius),
    shadowColor: AppStyle.accentColors.withOpacity(.3),
    elevation: 20,
    child:
    Column(mainAxisAlignment: MainAxisAlignment.start,children: [
      sizedS(),


        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
          sizedWS(),
          Flexible(flex: 2,child:
          Material(shadowColor: AppStyle.grey,borderRadius: BorderRadius.circular(Helper.borderRadius*3),elevation: 4,child:
          SizedBox(width:Helper.sW/4,height: Helper.sW/4,

           child:
          Column(mainAxisAlignment: MainAxisAlignment.end,children: [
            Flexible(flex: 4,child: appNumber(text: visit.visitStartDate!.day.toString(),
                style: AppStyle.h0BlackBold.copyWith(color: AppStyle.primaryColor))),
            sizedS(),
            Flexible(flex:3,child:
            Container(decoration: MainBoxDecorationStyle( AppStyle.primaryColor, 1),alignment: Alignment.center,height:double.infinity ,width: double.infinity,child:
            appText(text: Helper.dateTimeHelper.getMonthName(visit.visitStartDate!),style: AppStyle.h1WhiteLight))),

          ],),))),
          sizedWM(),
          Flexible(flex: 4,child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
           sizedM(),
            Row(children: [
              appText(text: "${appDic["Visit Number"]}: ", style: AppStyle.h3GreySemiBold),
              appNumber(text: visit.visitId.toString(), style: AppStyle.h2BlackBold),

            ],),
            Row(children: [
              Flexible(flex: 1,child:appText(text: "${appDic["Doctor"]} ", style: AppStyle.h3GreySemiBold)),
              Flexible(flex: 2,child: appText(text: visit.doctorName, maxLines: 1,style: AppStyle.h2PrimarySemiBold)),

            ],),
            Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Flexible(flex: 1,child:appText(text: "${appDic["Company"]} : ", style: AppStyle.h3GreySemiBold)),
              Flexible(flex: 2,child:appText(text: visit.company,maxLines: 2,style: AppStyle.h2BlackSemiBold)),

            ],),
            Row(children: [
              Flexible(flex: 1,child:appText(text: "${appDic["Clinic"]} : ", style: AppStyle.h3GreySemiBold)),
              Flexible(flex: 2,child:appText(text: visit.clinicName, style: AppStyle.h2BlackSemiBold)),

            ],),
          ],) )


        ],),

      sizedS(),
      showBtn==null?Column(children: [

        const Divider(),
        Padding(padding:EdgeInsets.symmetric(horizontal: Helper.outerPadding) ,child:AppButton(color: AppStyle.accentColors,
            textColor: AppStyle.black, text: appDic["Show Visits Details"], onPressed:(){
          Get.to(const VisitScreen(),arguments: [{"Visit":visit}]);
        } ))
        ,sizedM()

      ],):Container()


    ],)


    ,));

}