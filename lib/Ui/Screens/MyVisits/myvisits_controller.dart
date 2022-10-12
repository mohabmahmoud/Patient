import 'package:get/get.dart';
import 'package:patient/Data/Apis/patient_api.dart';
import 'package:patient/Data/Models/Visit/patient_app_visit_model.dart';

class MyVisitsController extends GetxController{
  bool loading=true;
  List<PatientAppVisitModel> visits=[];
  @override
  void onInit() async {
    getPatientVisits();
    super.onInit();
  }
  getPatientVisits()async{
    visits=await PatientApi.getPatientVisits();
    loading=false;
    update();

  }



}