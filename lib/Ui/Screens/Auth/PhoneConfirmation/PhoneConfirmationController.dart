import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Data/Apis/auth_api.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/Screens/Auth/Login/LoginScreen.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import '../../../../Core/Language/LangVariables.dart';
import '../../../../Data/Models/Auth/phone_confirmation_response.dart';

import '../../../../Data/Models/LookUps/dd_model.dart';
import '../CodeConfirmation/CodeConfirmation.dart';

class PhoneConfirmationController extends GetxController{
  DDModel ?selected;
  String phone="";
  onChangeCountry(val){

    selected=val;
    update();
  }
  onChangePhone(p){
    phone=p;

  }

  sendCode()async{
    if(phone.isNotEmpty){
    try {
      showLoading();
      PhoneConfirmationResponse response = await AuthApi.phoneConfirmation(phone);
      hideLoading();
      if(response.toNext==true){
      Get.to(const CodeConfirmation(),arguments: [{"Response":response}]);
      }else{
        if(response.dialog==true) {
          showErrorDialog(response.message!);
        }else {
          showFailedToast(response.message!);
        }

      }
    }catch(ex){
      hideLoading();
    }
  }else{
      showFailedToast("Please Enter Your Phone Number");
    }
  }

showErrorDialog(String message){

   showDialog(
    context: Helper.materialKey.currentContext!,
    builder: (BuildContext context) {
      return Dialog(insetPadding: EdgeInsets.all(Helper.outerPadding),child:
       Wrap(children:[Column(children: [
         sizedL(),

         Container(alignment: Alignment.center,child: appText(text: appDic["Error"], style: AppStyle.h0RedSemiBold)),
         const Divider(),
         appText(text: appDic[message], style: AppStyle.h2BlackSemiBold),
         sizedL(),
         Row(children: [
           sizedWS(),
           Flexible(flex: 1,child: AppButton(color: AppStyle.green,textColor: AppStyle.white,text: appDic["Login"],onPressed: (){
            Get.offAll(const LoginScreen());

           },)),
           sizedWS(),
           Flexible(flex: 1,child:AppButton(color: AppStyle.red,textColor: AppStyle.white,text: appDic["Close"],onPressed: (){
            Get.back();

           },)),
           sizedWS(),

         ],),
         sizedL(),





       ],),])
      );
    },
  );

}

}