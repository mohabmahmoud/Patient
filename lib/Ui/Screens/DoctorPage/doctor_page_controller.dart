import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Data/Apis/doctor_api.dart';
import 'package:patient/Data/Models/Doctor/doctor_model.dart';
import 'package:patient/Data/Models/LookUps/dd_model.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';

import '../NewAppointment/new_appointment.dart';
import 'Variables/doctor_page_variables.dart';
import 'Widgets/doctor_Appointments.dart';
class DoctorPageController extends GetxController{

  DoctorModel doctor= DoctorModel();
  List<DDModel> clinics=[];
  int ?selectClinicId=0;
  bool clinicsIsLoading=true;
  dynamic argumentData = Get.arguments;
  @override
  void onInit()async {
    doctor = argumentData[0]['doctor'];
    getClicks();
    super.onInit();
  }

  getClicks()async{

    clinics=await DoctorApi.getDoctorClinicsByEmployeeId(doctor.id!);
    clinicsIsLoading=false;
    try {
      selectClinicId = clinics.first.id;

  }catch(e){
      showFailedToast("No Clinics");

    }
    update();
}
  showDoctorDateAndSlots() async{
    showLoading();
    await getDaysWork();
    hideLoading();
    appointNow(getDaySlots,onchangeSlot,toNewAppointment);

  }
  getDaysWork()async{
    days.clear();
    var daysFromApi=await DoctorApi.getDaysWorkByEmployeeIdAndClinicId(doctor.id!,selectClinicId!);
    days.addAll(daysFromApi);
    getDaySlots(daysFromApi.firstWhere((element) => element.isSelect==true).dateTimeDay!);
    days.refresh();
  }
  getDaySlots(DateTime date)async{
    slots.clear();
    var slotsFromApi=await DoctorApi.getReservationTimeSlots(doctor.id!,selectClinicId!,date);
    slots.addAll(slotsFromApi);
    slots.refresh();
  }

  onchangeSlot(String str,int status){
    if(status==1) {
      selectedSlot.value = str;
      selectedSlot.refresh();
    }else{
      showFailedToast("هذا المعياد غير متاح");

    }
  }

  toNewAppointment(){

    Get.to(const NewAppointment(),arguments:[{
      "slot":selectedSlot.value,
      "Date":days.firstWhere((p0) => p0.isSelect==true).dateTimeDay!,
      "doctor":doctor,
      "clinic":selectClinicId!,
      "clinicName":clinics.firstWhere((element) => element.id==selectClinicId).name
    }] ,);
  }

  updateClinicId(int clinicId){
    selectClinicId=clinicId;
    update();

  }
}