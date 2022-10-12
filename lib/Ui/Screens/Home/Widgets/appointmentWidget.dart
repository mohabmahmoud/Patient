import 'package:flutter/material.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Data/Models/AppointmentModel/patient_future_appointment_model.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';

Widget appointWidget(PatientFutureAppointmentModel model){
  return

    Padding(padding:EdgeInsets.only(top: Helper.innerPadding) ,child:
    Container(padding:EdgeInsets.all(Helper.innerPadding) ,margin: EdgeInsets.all(Helper.outerPadding),
    decoration: MainOutLineBoxDecorationStyle(AppStyle.shadowColor,1,AppStyle.shadowColor),
    child:




        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [

          Flexible(flex: 2,child:
              Material(borderRadius: BorderRadius.circular(Helper.borderRadius*2),elevation:4,color: Colors.white,child:

          SizedBox(width:Helper.sW/5,height: Helper.sW/5,
          child:
          Column(mainAxisAlignment: MainAxisAlignment.end,children: [
            Flexible(flex:4,child:
            appNumber(text: model.appointmentDate!.day.toString(),style: AppStyle.h0BlackSemiBold)),

                Flexible(flex:3,child: Container(decoration: MainBoxDecorationStyle( AppStyle.primaryColor, 1),alignment: Alignment.center,height:double.infinity ,width: double.infinity,child:
            appText(text: Helper.dateTimeHelper.getMonthName(model.appointmentDate!),style: AppStyle.h3WhiteSemiBold))),

          ],),))



          ),
          sizedWS(),
          Flexible(flex: 4,child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            sizedS(),

            Row(children: [
              Flexible(flex: 1,child:appText(text: "${appDic["Doctor"]} : ", style: AppStyle.h3GreySemiBold)),
              Flexible(flex: 2,child: appText(text: model.doctorName, maxLines: 1,style: AppStyle.h2PrimarySemiBold)),

            ],),
            Row(children: [
              Flexible(flex: 1,child:appText(text: "${appDic["Clinic"]} : ", style: AppStyle.h3GreySemiBold)),
              Flexible(flex: 2,child:appText(text: model.clinicName, style: AppStyle.h2BlackSemiBold)),

            ],),
            Row(children: [
              Flexible(flex: 3,child:appText(text: "${appDic["Time"]} : ", style: AppStyle.h3GreySemiBold)),
              Flexible(flex: 8,child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
               Flexible(flex: 4,child:appNumber(text:Helper.dateTimeHelper.dateToString( model.appointmentDate!), style: AppStyle.h3BlackSemiBold)),
               sizedWS(),
               Flexible(flex: 7,child:Container(decoration: MainBoxDecorationStyle(AppStyle.green, 3),
                 padding: EdgeInsets.symmetric(vertical: Helper.innerPadding/2,horizontal: Helper.outerPadding*2),
                 child:appNumber(text: "${model.slot!.split(' ').first } ${appDic["${model.slot!.split(' ')[1]}Short"]}", style: AppStyle.h3WhiteLight),
               )),

             ],)),


            ],),
            sizedS(),

          ],) )


        ],),







      ));


}