import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/Screens/Home/Variables/doctor_page_variables.dart';
import 'package:patient/Ui/Screens/Home/Widgets/Doctor/home_doctor_loading.dart';
import 'package:patient/Ui/Screens/Home/Widgets/appointmentWidget.dart';
import 'package:patient/Ui/Screens/Search/search_screen.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/loader.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';

import '../../../Constants/paths.dart';
import 'Widgets/Categories/homeCategoryBuilder.dart';
import 'Widgets/Doctor/home_doctor_builder.dart';
import 'Widgets/home_appbar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return
      GetBuilder<HomeController>(
        init: HomeController(),
    builder: (ctr) {
    return screenDiraction(child: Scaffold(appBar:homeAppBar(),body:
    Column(children: [Expanded(child:
    SingleChildScrollView(child:
    Column(children: [
    sizedS(),
    Material(shadowColor: AppStyle.accentColors.withOpacity(.3),color: AppStyle.white,elevation: 5,child:

      Column(children: [
        sizedL(),

        Row(mainAxisAlignment: MainAxisAlignment.start, children: [


          Flexible(flex: 10, child:

          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            sizedWS(),
            Flexible(flex: 2, child:
            Container(padding: EdgeInsets.all(Helper.outerPadding),
                decoration:
                MainBoxDecorationStyle(
                    AppStyle.accentColors.withOpacity(.3), 3),
                height: 45,
                width: 45,
                child: Image.asset(userImage, color: AppStyle.accentColors,))),
            sizedWS(),
        Flexible(flex: 5, child:
            Column(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start, children: [

              appText(text: appDic["Welcome"],
                  style: AppStyle.h4GreySemiBold),

          appText(text: StorageHelper.readStorage("Name")
                  ,maxLines:2, style: AppStyle.h3BlackSemiBold)
            ],))
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
              appNumber(text: "${ctr.currentDate.day},${Helper.dateTimeHelper
                  .getMonthName(ctr.currentDate)}",
                  style: AppStyle.h4GreyLight),
              appNumber(
                  text: Helper.dateTimeHelper.timeFromDate(ctr.currentDate),
                  style: AppStyle.h3BlackSemiBold),
            ],),

          ],)


          )


        ]),
        const Divider(),

        (ctr.appointmentLoading) ?

             Column(children: [
          sizedL(),
          const Loader(),
          sizedL(),
        ],)
            : (myAppointments.isNotEmpty) ?
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              sizedM(),
              Padding(padding:EdgeInsets.symmetric(horizontal: Helper.innerPadding)
                  ,child: appText(text: appDic["Future Appointments"],
                      style: AppStyle.h1BlackSemiBold)),
              Wrap(children:myAppointments.map((element) {
                return    appointWidget(element);
              }).toList()

              ),
              sizedS(),
              
            ],)
             :
            Column(children: [
              sizedL(),
              appText(text: appDic["No Future Appointments"],
                  style: AppStyle.h3RedSemiBold),
              sizedL(),
            ],)



      ],)

    ),
    sizedS(),
    Material(elevation: 5,shadowColor: AppStyle.accentColors.withOpacity(.3),color: AppStyle.white,
    child:
    Column(children: [
      sizedM(),
      sizedM(),

    Padding(padding: const EdgeInsets.symmetric(horizontal: 5),child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    appText(text: appDic["Specialties"], style: AppStyle.h1BlackBold),

    ],)
    ),
      sizedM(),
    homeCategoryBuilder(),
      sizedM(),
      sizedM(),
    ],)


    ),
    sizedS(),
    Material(shadowColor: AppStyle.accentColors.withOpacity(.3),elevation:5,color: AppStyle.white,
    child:Column(children: [
      sizedM(),
      sizedM(),
    Padding(padding: const EdgeInsets.symmetric(horizontal: 5),child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    appText(text: appDic["Best Rated Doctors"], style: AppStyle.h1BlackBold),
    InkWell(onTap: (){
      Get.to(SearchScreen(title:appDic["Best Rated Doctors"], ),arguments: [{

      'BestRating':true,
      'IsAvailableNow':false,
      'SpecialityId':null,


      }]);


    },child:
    appText(text: appDic["More"], style: AppStyle.h3PrimarySemiBold)),

    ],)
    ),
    sizedM(),
      (ctr.bestIsLoading==true)?
      homeDoctorLoading():
      homeDoctorsBuilder(ctr.bestRatedDoctors),
    sizedM(),
    sizedM(),
    ],)),
    sizedS(),
    Material(shadowColor: AppStyle.accentColors.withOpacity(.3),elevation: 5,color: AppStyle.white,
    child:Column(children: [
      sizedM(),
      sizedM(),
    Padding(padding: const EdgeInsets.symmetric(horizontal: 5),child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
    appText(text: appDic["Doctors Available Now"], style: AppStyle.h1BlackBold),

        InkWell(onTap: (){


          Get.to(SearchScreen(title:appDic["Doctors Available Now"], ),arguments: [{

            'BestRating':false,
            'IsAvailableNow':true,
            'SpecialityId':null,


          }]);


        },child:
    appText(text: appDic["More"], style: AppStyle.h3PrimarySemiBold)),

    ],)
    ),
    sizedM(),
      (ctr.availableIsLoading==true)?homeDoctorLoading():
      homeDoctorsBuilder(ctr.availableNowDoctors),
      sizedM(),
      sizedM(),

    ],)),
    ],)
    )


    )]
    ))

    );

        });
  }
}
