import 'package:get/get.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Data/CachedData/cached_user_data.dart';
import 'package:patient/Ui/Screens/Auth/Login/LoginScreen.dart';

class MoreController extends GetxController{


logout(){

  CachedSessionData.userToken = "";
  int langId=StorageHelper.readStorage("Lang");
  StorageHelper.removeStorage();
  StorageHelper.writeStorageInt("Lang", langId);
  Get.offAll(const LoginScreen());

}


}