import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Constants/paths.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/Screens/Home/Variables/doctor_page_variables.dart';
import 'package:patient/Ui/Screens/Home/Widgets/appointmentWidget.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/loader.dart';

Widget appointmentsList(bool appointmentLoading,DateTime currentDate ){
  return Obx(() {
    return  Column(children: [
      sizedM(),

      Row(mainAxisAlignment: MainAxisAlignment.start, children: [


        Flexible(flex: 10, child:

        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(padding: EdgeInsets.all(Helper.outerPadding),
              decoration:
              MainBoxDecorationStyle(
                  AppStyle.accentColors.withOpacity(.3), 3),
              height: 45,
              width: 45,
              child: Image.asset(userImage, color: AppStyle.accentColors,)),
          sizedWS(),


          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            appText(text: appDic["Welcome"], style: AppStyle.h4GreySemiBold),

            appText(text: StorageHelper.readStorage("Name")
                , style: AppStyle.h4PrimarySemiBold)
          ],)
        ],)


        ),
        const Flexible(
            flex: 1, child: SizedBox(height: 50, child: VerticalDivider())),
        Flexible(flex: 9, child:
        Row(children: [
          Container(padding: EdgeInsets.all(Helper.outerPadding),
              decoration:
              MainBoxDecorationStyle(
                  AppStyle.accentColors.withOpacity(.3), 3),
              height: 45,
              width: 45,
              child: Image.asset(
                calendarImage, color: AppStyle.accentColors,)),
          sizedWS(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            appNumber(text: "${currentDate.day},${Helper.dateTimeHelper
                .getMonthName(currentDate)}",
                style: AppStyle.h4GreyLight),
            appNumber(
                text: Helper.dateTimeHelper.timeFromDate(currentDate),
                style: AppStyle.h4PrimarySemiBold),
          ],),

        ],)


        )


      ]),
      const Divider(),
      sizedL(),
      (appointmentLoading) ?
      const Loader()
          : (myAppointments.isNotEmpty) ? ListView.builder(
        itemCount: myAppointments.length, itemBuilder: (context, index) {
        return appointWidget(myAppointments[index]);
      },) :
      appText(text: "لا يوجد اى حجوزات مستقبيلية.",
          style: AppStyle.h3RedSemiBold),
      sizedL(),

    ],);
  });


}