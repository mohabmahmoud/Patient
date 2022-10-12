
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Ui/Screens/Taps/Taps.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';
import '../../../../Core/Helper/Helper.dart';
import '../../../../Core/Language/LangVariables.dart';
import '../../../../Style/AppStyle.dart';
import '../../../../Constants/paths.dart';
import '../../../SharedWidgets/AppButton.dart';
import '../../../SharedWidgets/InputField.dart';
import '../PhoneConfirmation/PhoneConfirmation.dart';
import 'LoginController.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(
        init: LoginController(),
    builder: (ctr) {


      return screenDiraction(child: Scaffold(bottomNavigationBar:
    SizedBox(height: Helper.sH/10,child:
    Padding(padding: EdgeInsets.all(Helper.outerPadding*2),

    child:InkWell(child:
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          appText(text: appDic["have an account"], style: AppStyle.h2BlackSemiBold,textAlign: TextAlign.center),
          appText(text: appDic["create account"], style: AppStyle.h3PrimarySemiBold,textAlign: TextAlign.center),

        ],)
      ,onTap: (){
Get.to(const PhoneConfirmation());

        })
    ,)),
      appBar: AppBar(),
      body:
      Padding(padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding*2),child:ListView(children: [
        appText(text:appDic["LoginTitle"],style: AppStyle.h0BlackSemiBold),
        appText(text:appDic["WelcomeLabel"],maxLines: 3,style: AppStyle.h2GreyLight),
        sizedL(),
        AppInputField(value: ctr.user,onchange: ctr.onChangeUser,preFexWidget: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),child:Image.asset(userImage,height: 15,width: 15,color: AppStyle.grey,)),label:appDic["UserName"] ),
        sizedS(),
        AppInputField(obscureText: true,value: ctr.password,onchange: ctr.onChangePassword,preFexWidget: Padding(padding: EdgeInsets.all(Helper.outerPadding+2),child:Image.asset(lockImage,height: 10,width: 10,color: AppStyle.grey,)),label:appDic["Password"] ),
        sizedM(),
        AppButton(color: AppStyle.accentColors,textColor: AppStyle.white,text: appDic["Login"],onPressed: ctr.login),

      ],))

      ,));});
  }
}
