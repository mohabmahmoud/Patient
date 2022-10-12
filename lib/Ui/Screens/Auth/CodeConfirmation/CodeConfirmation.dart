import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import '../../../../Core/Helper/Helper.dart';
import '../../../../Core/Language/LangVariables.dart';
import '../../../../Core/Storage/StorageHelper.dart';
import '../../../../Data/CachedData/cached_user_data.dart';
import '../../../../Data/Models/LookUps/dd_model.dart';
import '../../../../Style/AppStyle.dart';
import '../../../SharedWidgets/AppButton.dart';
import '../../../SharedWidgets/AppText.dart';
import '../../../SharedWidgets/InputField.dart';
import '../../../SharedWidgets/SizedBoxes.dart';
import '../../../SharedWidgets/screenDiraction.dart';
import '../CreateAccount/CreateAccount.dart';
import 'CodeConfirmationController.dart';
class CodeConfirmation extends StatefulWidget {
  const CodeConfirmation({Key? key}) : super(key: key);

  @override
  State<CodeConfirmation> createState() => _CodeConfirmationState();
}

class _CodeConfirmationState extends State<CodeConfirmation> {
  @override
  Widget build(BuildContext context) {
    return

      GetBuilder<CodeConfirmationController>(
          init: CodeConfirmationController(),
          builder: (ctr) {

      return screenDiraction(child:
      Scaffold(appBar: AppBar(),body:
      Padding(padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding*2),child:ListView(children: [
        appText(text:appDic['CodeConfirmation'],style:AppStyle.h0BlackSemiBold),
        appText(text:appDic['CodeConfirmationDesc'],maxLines: 2,style: AppStyle.h2GreyLight),
        appNumber(text:ctr.response!.phone!,style: AppStyle.h2PrimaryLight.copyWith(letterSpacing: 2,fontSize: 22,fontWeight: FontWeight.w100)),
        sizedL(),
        AppInputField(
          label:appDic["Code"],alignment: TextAlign.center,value: ctr.code,
          textStyle: AppStyle.h2PrimarySemiBold.copyWith(letterSpacing: 15),
          isNumber: true,
          onchange: ctr.onChangeCode,
        ),
        sizedS(),
        AppButton(color: AppStyle.accentColors,textColor: AppStyle.white,text: appDic["Confirmation"],
            onPressed: ctr.checkCode),
        sizedL(),

      ],))

        ,));

          });
  }
}
