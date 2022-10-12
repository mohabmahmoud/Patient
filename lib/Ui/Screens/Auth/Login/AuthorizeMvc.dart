import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Ui/Screens/Taps/Taps.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AuthorizeMvc extends StatelessWidget {
  String user;
  String password;
  AuthorizeMvc({Key? key, required this.user,required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebView(
        initialUrl:
        "${Helper.aPI.webUrl}AuthorizeMvcForAPI/AuthorizedMvcForAPI?User=$user&Password=$password",
        zoomEnabled: true,
        onPageStarted:(str){
          showLoading();
          print("onPageStarted");
        },onProgress: (str){
          print("onProgress");

    },javascriptMode:JavascriptMode.disabled,
        onPageFinished: (str){
          hideLoading();
          Get.offAll(const Taps());
        },
        onWebViewCreated: (webViewController) {
          // webViewController.clearCache();

        }


    ),);
  }
}
