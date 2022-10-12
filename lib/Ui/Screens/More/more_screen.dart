import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangHelper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/Screens/More/more_controller.dart';
import 'package:patient/Ui/Screens/Splash/SplashScreen.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return

      GetBuilder<MoreController>(
        init: MoreController(),
    builder: (ctr) {
    return screenDiraction(child: Scaffold(appBar: AppBar(centerTitle: false,elevation: .8,title: appText(text:appDic["More"],style: AppStyle.Title)),

    body: Column(children: [
      sizedM(),
      InkWell(child:
      Container(padding: EdgeInsets.all(Helper.outerPadding*2),decoration: MainBoxDecorationStyle(AppStyle.shadowColor, 1),child:
      Row(children: [
        sizedWM(),
        const Icon(Icons.language),
        sizedWM(),
        appText(text: appDic["Translate"], style:AppStyle.h2BlackSemiBold)

      ],)),onTap: ()async{


        int langId=StorageHelper.readStorage("Lang");
        LangHelper.changeLanguage(LangHelper.languages.firstWhere((element) => element.id!=langId).id);
        await Helper.helperInit();
        Get.offAll(const SplashScreen());

      },),
      sizedM(),
      InkWell(child:
      Container(padding: EdgeInsets.all(Helper.outerPadding*2),decoration: MainBoxDecorationStyle(AppStyle.shadowColor, 1),child:
      Row(children: [
        sizedWM(),
        const Icon(Icons.exit_to_app),
        sizedWM(),
        appText(text: appDic["Logout"], style:AppStyle.h2BlackSemiBold)

      ],)),onTap: (){

        ctr.logout();


      },),



    ],),


    ));
    });
  }
}
