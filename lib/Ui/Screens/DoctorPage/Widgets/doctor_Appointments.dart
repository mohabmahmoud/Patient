import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppIcons.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';

import '../Variables/doctor_page_variables.dart';

 appointNow(getSlots,onchangeSlot,toNewAppointment)  {

showModalBottomSheet(
isScrollControlled: false,
context: Helper.materialKey.currentContext!,
backgroundColor: Colors.white,
shape:  RoundedRectangleBorder(
borderRadius: BorderRadiusDirectional.only(
topEnd: Radius.circular(Helper.borderRadius*5),
topStart: Radius.circular(Helper.borderRadius*5),
),
),
builder: (context) =>
Padding(padding: const EdgeInsets.only(top: 30),child:
   Obx(() {

   return Scaffold(body:

   SingleChildScrollView(
   padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding/2),

   child: Column(children: [
   sizedM(),
   appText(text: appDic["Select Available Date And Time"], style: AppStyle.h1BlackBold),
   const Divider(),
   Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
   Flexible(flex: 1,child:

   iconS(icon:Icons.arrow_back_ios_rounded)
   ),

   Flexible(flex: 1,child:
   Row(mainAxisAlignment: MainAxisAlignment.center,children: [
   appNumber(text: "${days.firstWhere((element) => element.isSelect==true).dateTimeDay!.year} ", style: AppStyle.h1GreySemiBold),
   appText(text: Helper.dateTimeHelper.getMonthName(days.firstWhere((element) => element.isSelect==true).dateTimeDay!), style: AppStyle.h1GreySemiBold),

   ],)),

   Flexible(flex: 1,child:

   iconS(icon:Icons.arrow_forward_ios_rounded,)


   ),
   ],),
   sizedM(),
   SizedBox(height: 50,child:
   ListView.builder(itemCount: days.length,scrollDirection: Axis.horizontal,
   itemBuilder: (context,index){
   return
   InkWell(child:

   SizedBox(width: (Helper.sW/7)-((Helper.outerPadding)/7),child:
   Padding(padding: EdgeInsets.all(Helper.outerPadding/4),
   child:Container(decoration:
   (days[index].isSelect==true)?
   MainOutLineBoxDecorationStyle(AppStyle.black, 3,
   AppStyle.shadowColor):
   (days[index].status==1)?
   MainBoxDecorationStyle(AppStyle.shadowColor, 3):
   MainBoxDecorationStyle(AppStyle.grey.withOpacity(.8), 3),
   child: Padding(padding: EdgeInsets.symmetric(vertical:Helper.outerPadding/2,horizontal:Helper.outerPadding/2),child:
   Column(children: [
      appNumber(text: days[index].getDay(), style:(days[index].status==1)? AppStyle.h2BlackSemiBold:
      AppStyle.h2WhiteLight),
      appText(text: days[index].getDayName(), style: (days[index].status==1)?AppStyle.h4BlackSemiBold:
      AppStyle.h4WhiteSemiBold
      ),
   ],))),
   ))
      ,onTap: (){

   for(var x in days){
     x.isSelect=false;

   }
   days[index].isSelect=true;
   days.refresh();
   getSlots(days[index].dateTimeDay!);

   },);

   },

   )),
   const Divider(),
   Wrap( direction: Axis.horizontal,
   children: slots.map((i) =>

   InkWell(onTap: (){

      onchangeSlot(i.from!,i.state!);
   },child:
   Container(width: (Helper.sW/4)-((Helper.outerPadding)),margin:
   EdgeInsets.all(Helper.innerPadding/2),alignment: Alignment.center,decoration: MainBoxDecorationStyle((selectedSlot.value==i.from!)?AppStyle.primaryColor:(i.state==1)?AppStyle.green.withOpacity(.8):AppStyle.red.withOpacity(.6),2),padding: EdgeInsets.symmetric(vertical: Helper.outerPadding/2,horizontal: Helper.outerPadding,),child:
   appNumber(text:"${i.from!.split(' ').first } ${appDic["${i.from!.split(' ')[1]}Short"]}",
       style: AppStyle.h3WhiteLight)))


   ).toList(),),],),

   ),
   bottomNavigationBar:
   Container(padding: EdgeInsets.all(Helper.outerPadding),child:AppButton(textColor: AppStyle.white,onPressed: (){

      toNewAppointment();
   },text: appDic["Next"],color: AppStyle.accentColors))


   );
   })
));
}
