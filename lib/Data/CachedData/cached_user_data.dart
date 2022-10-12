import 'package:get/get.dart';
import 'package:patient/Data/Apis/patient_api.dart';

import '../Models/LookUps/dd_model.dart';
import '../Models/LookUps/speciality_model.dart';

class CachedSessionData{
  static String userToken='';
  static List<DDModel> countries=[DDModel(id: 1,key: " 20+ " ,name: "https://wallpaperaccess.com/full/139873.jpg")];
  static Rx<int> currentIndex=0.obs;
  static Rx<bool> noInterNet=false.obs;
  static List<SpecialityModel> specialities=[];
  static start()async{
    specialities=[];
    specialities=await PatientApi.getAllSpecialityForApp();
  }


}