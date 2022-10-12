import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Ui/Screens/Taps/Taps.dart';
import 'package:patient/Ui/SharedWidgets/AppCheckBox.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/loader.dart';
import '../../../../Constants/paths.dart';
import '../../../../Core/Helper/Helper.dart';
import '../../../../Core/Language/LangVariables.dart';
import '../../../../Style/AppStyle.dart';
import '../../../SharedWidgets/AppButton.dart';
import '../../../SharedWidgets/AppDatePicker.dart';
import '../../../SharedWidgets/InputField.dart';
import '../../../SharedWidgets/SizedBoxes.dart';
import '../../../SharedWidgets/screenDiraction.dart';
import 'CreateAccountController.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<CreateAccountController>(
        init: CreateAccountController(),
    builder: (ctr) {

   return screenDiraction(child: Scaffold(
    appBar: AppBar( ),
    body: Padding(padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding*2),child:ListView(children: [
    appText(text:appDic["Create New Account"],style: AppStyle.h0BlackSemiBold),
    appText(text:
    appDic["Create New Account Desc"],maxLines: 2,style: AppStyle.h2GreyLight),

     ctr.isLoading?
          const Center(child: Loader())
         :Column(children: [
           sizedL(),
           AppInputField(value: ctr.patient.fullName,onchange: ctr.onChangeName,preFexWidget: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),
               child:Image.asset(userImage,height: 15,width: 15,color: AppStyle.grey,)),label:appDic["Full Name"] ),
           sizedS(),
           AppInputField(value: ctr.patient.email,onchange: ctr.onChangeEmail,preFexWidget: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),child:Image.asset(emailImage,height: 15,width: 15,color: AppStyle.grey,)),label:

           appDic["Email"]),
           sizedS(),
           AppInputField(disable: true, value:ctr.patient.phone,preFexWidget: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),child:Image.asset(phoneImage,height: 10,width: 10,color: AppStyle.grey,)),label:appDic["Phone"] ),
           sizedS(),
           AppInputField(obscureText: true,onchange: ctr.onChangePassword,preFexWidget: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),child:Image.asset(lockImage,height: 10,width: 10,color: AppStyle.grey,)),label:appDic["Password"]),
           sizedS(),

        Material(
          borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius))

          ,elevation: 1,child:
        SizedBox(height: Helper.itemsHeight,child:
           InputDecorator(
               decoration: InputDecoration(
                 filled: true,
                 fillColor: AppStyle.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 23),
                focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
                 borderSide: BorderSide(color: AppStyle.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
                 borderSide: BorderSide(color: AppStyle.primaryColor.withOpacity(0.15)),
                ),

                hintStyle: AppStyle.h4GreySemiBold,
                // ignore: prefer_if_null_operators
                prefixIcon:Padding(padding: EdgeInsets.all(Helper.outerPadding+2),child:Image.asset(genderImage,height: 10,width: 10,color: AppStyle.grey,)),
               ),child:
           Row(children: [
            Flexible(flex: 1,child:
            appText(text: appDic["Gender"], style:AppStyle.h2GreyLight)),
            Flexible(flex: 2,child:
              appCheckBox(onChange: (c){
              ctr.onChangeGender(1);
            },value:ctr.patient.gender==1,text:appDic["Mail"], style:AppStyle.h2BlackLight),
            ),
            Flexible(flex: 2,child:
              appCheckBox(onChange: (c){
              ctr.onChangeGender(2);
            },value:ctr.patient.gender==2,text: appDic["FeMail"], style:AppStyle.h2BlackLight)),

           ],)))),
           sizedL(),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
             Flexible(flex: 3,child:

                 appDatePicker(onChange:ctr.onChangeBirthDate,hint: appDic["BirthDate"],
                 val: ctr.patient.birthDate,preFix: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),
                     child:Image.asset(birthdateImage,height: 10,width: 10,color: AppStyle.grey,)))),


             sizedWS(),
             Flexible(flex: 2,child: AppInputField(onchange: ctr.onChangeAge,isNumber: true,value: ctr.patient.age.toString(),label:appDic["Age"],alignment: TextAlign.center,),
             )
            ],
           ),
           sizedL(),
           AppButton(color: AppStyle.accentColors,textColor: AppStyle.white,text:appDic["Create Account"],onPressed:ctr.createAccountNewAccount,),
           sizedL(),

     ],)


    ],)),));
    });
  }
}
