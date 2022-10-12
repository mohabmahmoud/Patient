import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Data/Apis/doctor_api.dart';
import 'package:patient/Data/Models/AppointmentModel/appointment_model.dart';
import 'package:patient/Data/Models/Doctor/doctor_model.dart';
import 'package:patient/Data/Models/LookUps/base_response.dart';
import 'package:patient/Data/Models/LookUps/dd_model.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';

class NewAppointmentController extends GetxController{

  String slot= "";
  DoctorModel doctor= DoctorModel();
  DateTime ?dateTime;
  int ?clinicId=0;
  List<DDModel> clinicServices=[];
  bool isLoading=true;
   int ?serviceId;
   String clinicName="";

  dynamic argumentData = Get.arguments;
  @override
  void onInit()async {
    slot = argumentData[0]['slot'];
    dateTime = argumentData[0]['Date'];
    doctor = argumentData[0]['doctor'];
    clinicId = argumentData[0]['clinic'];
    clinicName = argumentData[0]['clinicName'];

    getClinicServices();
    super.onInit();
  }
  getClinicServices()async{

    clinicServices=await DoctorApi.getClinicServices(clinicId!);
    isLoading=false;
    update();
  }

  onChangeClinic(String servicesId){
    serviceId=int.parse(servicesId);
    update();

  }

  select(int selectedServiceId){

    serviceId=selectedServiceId;
    update();
  }



  newAppointment()async{

    AppointmentModel model=AppointmentModel();
    model.slot=slot;
    model.doctorId=doctor.id;
    model.serviceId=serviceId;
    model.clinicId=clinicId;
    model.appointmentDate=dateTime;
    showLoading();
    AppBaseResponse response=await DoctorApi.newAppointment(model);
    hideLoading();
    if(response.isError){
      showFailedToast(response.errorMessage);

    }else{
      showSuccessToast("تم الحجز بنجاح");
      Get.back();
      Get.back();




    }


  }
}