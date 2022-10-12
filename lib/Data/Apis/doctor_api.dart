import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Data/Models/AppointmentModel/appointment_model.dart';
import 'package:patient/Data/Models/Doctor/doctors_filter_model.dart';
import 'package:patient/Data/Models/LookUps/base_response.dart';
import 'package:patient/Data/Models/LookUps/dd_model.dart';
import 'package:patient/Ui/Screens/DoctorPage/Variables/time_slots_model.dart';
import '../../Ui/Screens/DoctorPage/Variables/day_model.dart';
import '../Models/Doctor/doctor_model.dart';

class DoctorApi{
  static const String _controller="/PatientApp/";

  static Future<List<DoctorModel>> getAllDoctorForPatientApp(DoctorsFilter filter)async{
    var response=await Helper.aPI.donePost("${_controller}GetAllDoctorsForPatientApp",filter.toJson());
    List<DoctorModel> doctors=[];
    for(var doctor in response){
      doctors.add(DoctorModel.fromJson(doctor));
    }
    return doctors;
  }
  static Future<List<DDModel>> getDoctorClinicsByEmployeeId(int employeeId)async{
    var response=await Helper.aPI.doneGet("${_controller}GetDoctorClinicsByEmployeeId?EmployeeId=$employeeId");
    List<DDModel> clinics=[];
    for(var clinic in response){
      clinics.add(DDModel.fromJson(clinic));
    }
    return clinics;
  }
  static Future<List<DayModel>> getDaysWorkByEmployeeIdAndClinicId (int employeeId,int clinicId)async{
    var response=await Helper.aPI.doneGet("${_controller}GetDaysWorkByEmployeeIdAndClinicId?EmployeeId=$employeeId&ClinicId=$clinicId");
    List<DayModel> days=[];
    for(var day in response){
      DayModel dayModel=DayModel.fromJson(day);
      if(dayModel.status==1&&days.where((element) => element.isSelect==true).isEmpty) {
        dayModel.isSelect = true;
      }
      days.add(dayModel);
    }
    return days;


  }
  static Future<List<TimeSlot>> getReservationTimeSlots (int employeeId,int clinicId,DateTime dateTime)async{
    var response=await Helper.aPI.doneGet("${_controller}ReservationTimeSlot?DoctorId=$employeeId&ClinicId=$clinicId&SelectedClinicDoctorId=0&reservationDate=${dateTime.toString()}");
    List<TimeSlot> slots=[];
    for(var day in response){
      slots.add(TimeSlot.fromJson(day));
    }
    return slots;


  }

  static Future<List<DDModel>> getClinicServices(int clinicId)async{
    var response=await Helper.aPI.doneGet("${_controller}GetClinicServices?ClinicId=$clinicId");
    List<DDModel> clinicServices=[];
    for(var clinicService in response){
      clinicServices.add(DDModel.fromJson(clinicService));
    }
    return clinicServices;


  }


  static Future<AppBaseResponse> newAppointment(AppointmentModel model)async{
    var response=await Helper.aPI.donePost("${_controller}NewAppointment",model.toJson());
    return AppBaseResponse.fromJson(response);
  }

  static Future<AppBaseResponse> ratingDoctorVisit({required int visitId,required int doctorId,required double rate})async{
    var response=await Helper.aPI.donePost("${_controller}RatingDoctorVisit",{
      "DoctorId":doctorId,
      "Rate":rate.toString(),
      "VisitId":visitId,
      "Review":""



    });
    return AppBaseResponse.fromJson(response);
  }


  static Future<double?> getVisitRating(int visitId)async{
    var response=await Helper.aPI.doneGet("${_controller}GetVisitRating?visitId=$visitId");
    return response;
  }

}