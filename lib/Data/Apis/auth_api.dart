import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Data/Models/Patient/patient_app_model.dart';
import 'package:patient/Ui/Screens/Taps/Taps.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';

import '../../Ui/Screens/Auth/Login/AuthorizeMvc.dart';
import '../CachedData/cached_user_data.dart';
import '../Models/Auth/login_response.dart';
import '../Models/Auth/phone_confirmation_response.dart';
import '../Models/LookUps/base_response.dart';

class AuthApi{
  static const String _controller="/Auth/";

  static Future<PhoneConfirmationResponse> phoneConfirmation(String phone)async{
    var response=await Helper.aPI.doneGet("${_controller}PhoneConfirmation?phone=$phone");
    return PhoneConfirmationResponse.fromJson(response);
  }

  static Future<AppBaseResponse> checkConfirmationCode(int phoneConfirmationId,String code)async{
    var response=await Helper.aPI.doneGet("${_controller}CheckConfirmationCode?PhoneConfirmationId=$phoneConfirmationId&Code=$code");
    return AppBaseResponse.fromJson(response);
  }

  static Future<AppBaseResponse> signUP(PatientApp patientApp)async{
    var response=await Helper.aPI.donePost("${_controller}Signup",patientApp.toJson());
    return AppBaseResponse.fromJson(response);
  }

  static Future<LoginResponse> logIn(String userName,String password)async{
    showLoading();
    var responseData=await Helper.aPI.donePost("${_controller}LogIn",{'Email': userName, 'Password': password});
    hideLoading();
     var response=LoginResponse.fromJson(responseData);
     if(!response.isError!){
       CachedSessionData.userToken=response.token!;
       StorageHelper.writeStorageString("Token", response.token!);
       StorageHelper.writeStorageString("Name", response.userName!);

         Get.to(AuthorizeMvc(user: userName, password: password,));

     }else{
       showFailedToast(response.msg!);
     }
    return response;
  }

}