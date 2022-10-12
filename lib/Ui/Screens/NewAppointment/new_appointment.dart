import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppDropDawn.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';
import 'new_appointment_controller.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<NewAppointmentController>(
        init: NewAppointmentController(),
    builder: (ctr) {
    return screenDiraction(child:Scaffold(appBar: AppBar(centerTitle: false,elevation: .6,
        title:  Text(appDic["Confirm Appointment"],style: AppStyle.h1BlackBold.copyWith(height: 4),)),body:
        Padding(padding: EdgeInsets.all(Helper.outerPadding*2),child:Column(children: [
          sizedM(),
          Container(decoration: MainOutLineBoxDecorationStyle(AppStyle.shadowColor, 1, AppStyle.shadowColor),height: Helper.itemsHeight,padding:
          EdgeInsets.symmetric(horizontal: Helper.innerPadding),
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            appText(text: ctr.doctor.name!, style: AppStyle.h3BlackSemiBold),
            Image.asset("Images/DoctorScreen/checked.png",height: Helper.iconS,)



          ],)

          ),
          sizedS(),
          Container(decoration: MainOutLineBoxDecorationStyle(AppStyle.shadowColor, 1, AppStyle.shadowColor),height: Helper.itemsHeight,padding:
          EdgeInsets.symmetric(horizontal: Helper.innerPadding),
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                appText(text: ctr.clinicName, style: AppStyle.h3BlackSemiBold),
                Image.asset("Images/DoctorScreen/checked.png",height: Helper.iconS,)



              ],)

          ),
          sizedS(),
          Row(children: [
            Flexible(flex: 3,child:Container(decoration: MainOutLineBoxDecorationStyle(AppStyle.shadowColor, 1, AppStyle.shadowColor),height: Helper.itemsHeight,padding:
            EdgeInsets.symmetric(horizontal: Helper.innerPadding),
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  appNumber(text: Helper.dateTimeHelper. dateToString(ctr.dateTime!), style: AppStyle.h3BlackSemiBold),
                  Image.asset("Images/DoctorScreen/checked.png",height: Helper.iconS,)



                ],)

            ), ),
            sizedWS(),
            Flexible(flex: 2,child:Container(decoration: MainOutLineBoxDecorationStyle(AppStyle.shadowColor, 1, AppStyle.shadowColor),height: Helper.itemsHeight,padding:
            EdgeInsets.symmetric(horizontal: Helper.innerPadding),
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  appText(text: Helper.dateTimeHelper.getDayName(ctr.dateTime!), style: AppStyle.h3BlackSemiBold),
                  Image.asset("Images/DoctorScreen/checked.png",height: Helper.iconS,)



                ],)

            ), ),
            sizedWS(),
            Flexible(flex: 2,child:Container(decoration: MainOutLineBoxDecorationStyle(AppStyle.shadowColor, 1, AppStyle.shadowColor),height: Helper.itemsHeight,padding:
            EdgeInsets.symmetric(horizontal: Helper.innerPadding),
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  appNumber(text:ctr.slot, style: AppStyle.h3BlackSemiBold),
                  Image.asset("Images/DoctorScreen/checked.png",height: Helper.iconS,)



                ],)

            ), ),
          ],),
          sizedS(),
          dropDownFilter(items:ctr.clinicServices,hint: appDic["Select Service"],selected: ctr.serviceId ,functionOnChange: ctr.onChangeClinic),
          sizedL(),
          AppButton(textColor: AppStyle.white,onPressed: (){

            ctr.newAppointment();
          },text: appDic["Confirmation"],color: AppStyle.accentColors)

        ],))
    ),);
    });
  }
}
