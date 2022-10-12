import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Core/Storage/StorageHelper.dart';
import 'package:patient/Ui/Screens/Auth/Login/LoginScreen.dart';
import '../../Core/Language/LangVariables.dart';
import '../CachedData/cached_user_data.dart';

class BaseAPI {
   String webUrl = 'http://192.168.1.150:8020/';
   String baseUrl = 'http://192.168.1.111:53896/Api';
   String noInternet = "No Internet";
   String timeout = "Timeout";
   var headers = {
     'Content-Type': 'application/json',
     'Accept': 'application/json',
     "Accept-Language": langShortName
   };

   Future<dynamic> doneGet(String action) async {
    try {
      updateToken();
      var result = await http.get(Uri.parse(baseUrl + action), headers: headers);
      authorizationCheck(result.body);
      return json.decode(result.body);
    } on SocketException catch (_) {
      return {};
    } on TimeoutException catch (_) {
      return {};
    }
  }


   Future<dynamic> donePost(String action, Map<String, dynamic> postBody) async {
    try {
      updateToken();
      var result = await http.post(Uri.parse(baseUrl + action),body: json.encode(postBody), headers: headers);
      authorizationCheck(result.body);
      return json.decode(result.body);
    } on SocketException catch (_) {
      return {};
    } on TimeoutException catch (_) {
      return {};
    }
  }

   Future doneMultiplePost(String action, List<dynamic> postBody) async {
    try {
      updateToken();


      var result = await http.post(Uri.parse(baseUrl + action),
          body: json.encode(postBody), headers: headers);
      authorizationCheck(result.body);

      return result.body;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }

   Future doneDelete(String action) async {
    try {

      updateToken();
      var result =
      await http.delete(Uri.parse(baseUrl + action), headers: headers);
      authorizationCheck(result.body);
      return result.body;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }

   Future donePostMultipartRequest(String action,Map<String, String> postBody,String imageKey, String imagePath) async {
     updateToken();
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(baseUrl +action));
    request.fields.addAll(postBody);
    if(imagePath.isNotEmpty){
    request.files
        .add(await http.MultipartFile.fromPath(imageKey, imagePath));}
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final respStr = await response.stream.bytesToString();
    return respStr;
  }



  void updateToken(){
    if (CachedSessionData.userToken != "") {
      headers["Authorization"] = "Bearer ${CachedSessionData.userToken}";
    }else{

      headers.remove('Authorization');
    }


  }
  authorizationCheck(dynamic body){
try {
  if (body == "{\"Message\":\"Authorization has been denied for this request.\"}") {
    CachedSessionData.userToken = "";
    int langId=StorageHelper.readStorage("Lang");
    StorageHelper.removeStorage();
    StorageHelper.writeStorageInt("Lang", langId);
    showFailedToast("تم انتهاء الصلاحيه الدخول");
    Get.offAll(const LoginScreen());
    return null;
  }
}catch (ex){
  showFailedToast(ex.toString());


}

    }

}
