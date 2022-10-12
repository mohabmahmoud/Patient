
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Data/Models/AppointmentModel/patient_future_appointment_model.dart';
import 'package:patient/Data/Models/Patient/patient_app_model.dart';
import 'package:patient/Data/Models/Results/patient_results.dart';
import 'package:patient/Data/Models/Visit/patient_app_visit_model.dart';
import 'package:patient/Ui/Screens/Home/Variables/doctor_page_variables.dart';

import '../Models/LookUps/speciality_model.dart';

class PatientApi{
  static const String _controller="/PatientApp/";
  static Future<PatientApp> getPatientAppByPatientId(int patientId)async{
    var response=await Helper.aPI.doneGet("${_controller}GetPatientAppByPatientId?PatientId=$patientId");
    return PatientApp.fromJson(response);
  }
  static Future<List<PatientAppVisitModel>> getPatientVisits()async{
    List<PatientAppVisitModel> visits=[];
    var response=await Helper.aPI.doneGet("${_controller}GetPatientVisits");
    for(var v in response) {
      visits.add(PatientAppVisitModel.fromJson(v));
    }
    return visits;
  }
  static Future<List<PatientResults>> getResults(int visitId,String type)async{
    List<PatientResults> results=[];
    var response=await Helper.aPI.doneGet("${_controller}Get${type}Results?VisitId=$visitId");
    for(var result in response){
      results.add(PatientResults.fromJson(result));
    }
    return results;
  }
  static Future<List<SpecialityModel>> getAllSpecialityForApp()async{

    List<SpecialityModel> results=[];
    var response=await Helper.aPI.doneGet("${_controller}GetAllSpecialityForApp");
    print(response);
    try {
      for (var result in response) {
        results.add(SpecialityModel.fromJson(result));
      }
    }catch(E){


    }
    return results;

  }
  //____________________________________________
  static Future<List<PatientFutureAppointmentModel>> getPatientAppointments()async{
    myAppointments.clear();
    var response=await Helper.aPI.donePost("${_controller}GetPatientAppointments",{});
    for(var result in response){
      myAppointments.add(PatientFutureAppointmentModel.fromJson(result));
    }
    myAppointments.refresh();

    return [];

  }

}