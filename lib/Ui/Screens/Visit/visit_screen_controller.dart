import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Data/Apis/doctor_api.dart';
import 'package:patient/Data/Models/LookUps/base_response.dart';
import 'package:patient/Data/Models/Visit/patient_app_visit_model.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';

class VisitScreenController extends GetxController{
  PatientAppVisitModel ?visit;
  dynamic argumentData = Get.arguments;
  double ?rate;
  bool rateLoading=true;
  double rateFromBar=0.0;
  @override
  void onInit()async {
    visit = argumentData[0]['Visit'] ;
    getVisitRating();
    super.onInit();
  }
  getVisitRating()async{
    rate=await DoctorApi.getVisitRating(visit!.visitId!);
    if(rate!=null){
      rateFromBar=rate!;
    }
    rateLoading=false;
    update();

  }

  onchangeRating(double rate){
    rateFromBar=rate;
    print(rateFromBar);
    update();

  }

  ratingDoctor()async{
  showLoading();
  AppBaseResponse response=await DoctorApi.ratingDoctorVisit(visitId: visit!.visitId!,
      doctorId: 0, rate: rateFromBar);
  hideLoading();
  if(!response.isError){
    showSuccessToast(response.successMessage);
    rate=rateFromBar;
    update();

  }else{
    showFailedToast(response.errorMessage);

  }


  }


}