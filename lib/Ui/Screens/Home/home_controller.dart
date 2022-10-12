import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient/Data/Apis/doctor_api.dart';
import 'package:patient/Data/Apis/patient_api.dart';
import 'package:patient/Data/Models/Doctor/doctor_model.dart';
import 'package:patient/Data/Models/Doctor/doctors_filter_model.dart';

class HomeController extends GetxController{
  bool bestIsLoading=true;
  bool availableIsLoading=true;
  List<DoctorModel> bestRatedDoctors=[];
  List<DoctorModel> availableNowDoctors=[];
  bool appointmentLoading=false;

  DateTime currentDate=DateTime.now();

  @override
  void onInit() async {

    getBestRatedDoctors();
    getAvailableNowDoctors();
    getAppointments();
    super.onInit();
  }
  void getBestRatedDoctors()async{
    DoctorsFilter filter= DoctorsFilter();
    filter.bestRating=true;
    bestRatedDoctors=await DoctorApi.getAllDoctorForPatientApp(filter);
    bestIsLoading=false;
    update();


  }
  void getAvailableNowDoctors()async{
    DoctorsFilter filter= DoctorsFilter();
    filter.iSAvailableNow=true;
    availableNowDoctors=await DoctorApi.getAllDoctorForPatientApp(filter);
    availableIsLoading=false;
    update();


  }
  void getAppointments()async{
    appointmentLoading=true;
    update();
    var f=await PatientApi.getPatientAppointments();
    appointmentLoading=false;
    update();

  }

}