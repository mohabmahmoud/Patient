import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Helper/Helper.dart';
import '../../../../Core/Language/LangVariables.dart';
import '../../../../Data/CachedData/cached_user_data.dart';
import '../../../../Data/Models/LookUps/dd_model.dart';
import '../../../../Style/AppStyle.dart';
import '../../../SharedWidgets/AppButton.dart';
import '../../../SharedWidgets/AppText.dart';
import '../../../SharedWidgets/InputField.dart';
import '../../../SharedWidgets/SizedBoxes.dart';
import '../../../SharedWidgets/screenDiraction.dart';
import '../CodeConfirmation/CodeConfirmation.dart';
import 'PhoneConfirmationController.dart';
class PhoneConfirmation extends StatefulWidget {
  const PhoneConfirmation({Key? key}) : super(key: key);

  @override
  State<PhoneConfirmation> createState() => _PhoneConfirmationState();
}

class _PhoneConfirmationState extends State<PhoneConfirmation> {
  @override
  Widget build(BuildContext context) {
    return
      screenDiraction(child:
      GetBuilder<PhoneConfirmationController>(
          init: PhoneConfirmationController(),
    builder: (ctr) {
   return  Scaffold(appBar: AppBar(),body:
    Padding(padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding*2),child:ListView(children: [
       sizedM(),
       appText(text:appDic['PhoneConfirmation'],style: AppStyle.h0BlackSemiBold),
       appText(text:appDic["PhoneConfirmationHint"],maxLines: 3,style: AppStyle.h2GreyLight),
       sizedL(),
       AppInputField(
    label:appDic["Phone"]??"",
    preFexWidget:Container(
     height: Helper.itemsHeight,
    padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding),
    decoration: const BoxDecoration(
    border: Border(
    right: BorderSide(
    width: 0.01),
    ),
    ),
    margin: const EdgeInsets.all(3.0),
    //width: 300.0,
    child: DropdownButtonHideUnderline(
    child: ButtonTheme(
    alignedDropdown: true,
    child: DropdownButton(elevation: 1,isDense: true,value: ctr.selected,isExpanded:ctr.selected==null,enableFeedback: true,
    hint: Text(appDic["Country Code"]),style: AppStyle.h3GreySemiBold,

    items: CachedSessionData.countries
        .map((DDModel value) {
    return
     DropdownMenuItem<DDModel>(alignment: Alignment.bottomCenter,
    value: value,
    child: Row(
    children: [
    sizedWS(),

      Image.network(
        value.name,
        width: 30,
        height: 50,
      ),
      appText(
        text: " مصر ",
        style: AppStyle.h4BlackBold,
      ),
      appText(
        text:"  ${value.key!} ",
        style: AppStyle.h3GreySemiBold,
      ),






    ],
    ));
    }).toList(),
    onChanged:ctr.onChangeCountry,
    ),
    ),
    ),
    ),
    isNumber: true,
    onchange: ctr.onChangePhone,
    ),
       sizedL(),
       AppButton(color: AppStyle.accentColors,textColor: AppStyle.white,text: appDic["Send Confirmation Code"],onPressed: ctr.sendCode,),
       sizedL(),

    ],))

    ,);

    }));
  }
}
