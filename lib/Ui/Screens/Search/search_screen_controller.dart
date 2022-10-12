import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Data/Apis/doctor_api.dart';
import 'package:patient/Data/Models/Doctor/doctor_model.dart';
import 'package:patient/Data/Models/Doctor/doctors_filter_model.dart';

class SearchScreenController extends GetxController{
  List<DoctorModel> filteredDoctors=[];
  bool isLoading=true;
  bool noMore=false;
  DoctorsFilter filter= DoctorsFilter();

  dynamic argumentData = Get.arguments;
  @override
  void onInit()async {
   if(argumentData!=null&&argumentData.length!=0) {
     filter.bestRating = argumentData[0]['BestRating'];
     filter.iSAvailableNow = argumentData[0]['IsAvailableNow'];
     filter.specialityId = argumentData[0]['SpecialityId'];
   }
    getFilterDoctors();
    super.onInit();
  }

  onChange(String name){
    filter.doctorName=name;
    update();

  }
  Future<bool> search()async{
    filteredDoctors.clear();
    filter.pageIndex=0;
    noMore=false;
    isLoading=true;
    update();
    await getFilterDoctors();
    return isLoading;
  }
  Future<bool> getFilterDoctors()async{
    filteredDoctors.addAll(await DoctorApi.getAllDoctorForPatientApp(filter));
    isLoading=false;
    noMore=false;
    update();
    return isLoading;

  }
  Future<bool> loadMore(ScrollNotification scrollInfo)async{
    bool x=false;
    if (scrollInfo.metrics.pixels ==
        scrollInfo.metrics.maxScrollExtent&&isLoading==false&&noMore!=true) {
      int len=filteredDoctors.length;
      filter.pageIndex=filter.pageIndex!+1;
      isLoading=true;
      update();
       x=await getFilterDoctors();
      if(len==filteredDoctors.length){
       showSuccessToast("No More Data");
       noMore=true;
       update();
      }
    }
    return x;

  }
}