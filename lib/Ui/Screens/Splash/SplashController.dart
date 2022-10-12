import 'dart:async';

import 'package:get/get.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Data/CachedData/cached_user_data.dart';
import 'package:patient/Ui/Screens/Auth/Login/LoginScreen.dart';

import '../Taps/Taps.dart';

class SplashController extends GetxController{


  void startApp() async {
    await CachedSessionData.start();
    if(StorageHelper.readStorage("Token")!=null){
      CachedSessionData.userToken=StorageHelper.readStorage("Token");
      Get.off( const Taps());
    }else {
      Get.offAll(const LoginScreen());
    }
  }

  @override
  void onInit() async {
    Timer(const Duration(seconds:1), () async {
      startApp();
    });
    super.onInit();
  }

}