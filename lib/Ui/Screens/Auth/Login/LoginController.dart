import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Data/Apis/auth_api.dart';


class LoginController extends GetxController{
  String user="";
  String password="";
  dynamic argumentData = Get.arguments;
  @override
  void onInit()async {
    try {
      user = argumentData[0]['Phone'] ?? "";
      password = argumentData[0]['Password'] ?? "";
    }catch(E){
      user="";
      password="";
    }
    update();
    super.onInit();
  }
  login()async{
    if(user.isEmpty){
      showFailedToast("قم بادخال رقم الهاتف او البريد اللالكترونى");
    }else if(password.isEmpty){
      showFailedToast("قم بادخال كلمة المرور");
    }else {
      await AuthApi.logIn(user, password);
    }
  }

  onChangeUser(name){
    user=name;

  }
  onChangePassword(pass){
   password=pass;

  }


}