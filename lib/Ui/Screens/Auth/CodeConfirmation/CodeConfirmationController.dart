import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Data/Apis/auth_api.dart';
import 'package:patient/Data/Models/Auth/phone_confirmation_response.dart';
import 'package:patient/Data/Models/LookUps/base_response.dart';
import 'package:patient/Ui/Screens/Auth/CreateAccount/CreateAccount.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';

import '../../../../Data/Models/LookUps/dd_model.dart';

class CodeConfirmationController extends GetxController{
  String code="";
  onChangeCode(codeChange){
    code=codeChange;
  }
  dynamic argumentData = Get.arguments;
  PhoneConfirmationResponse ?response;
  @override
  void onInit()async{
    response = argumentData[0]['Response'];
    super.onInit();
  }
  checkCode()async{
    if(code.isNotEmpty){
      try {
        showLoading();
        AppBaseResponse responseData = await AuthApi.checkConfirmationCode(response!.phoneConfirmationId!,code);
        hideLoading();
        if(responseData.isError!=true){
          Get.to(const CreateAccount(),arguments: [{"PatientId":response!.patientId,"Phone":response!.phone}]);
        }else{
          try {
            response!.phoneConfirmationId =
                int.parse(responseData.successMessage);
          }catch(E){
            showFailedToast("");

          }
          showFailedToast(responseData.errorMessage);
        }
      }catch(ex){
        hideLoading();
      }
    }else{
      showFailedToast("Please Enter Code");
    }
  }




}