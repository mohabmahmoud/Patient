import 'package:get/get.dart';
import 'package:patient/Data/Apis/patient_api.dart';
import 'package:patient/Data/Models/Results/patient_results.dart';

class LabResultController extends GetxController{
  int ?visitId;
  bool isLoading=true;
  List<PatientResults> results=[];
  String type="";
  int labOrRadOrRx=1;
  dynamic argumentData = Get.arguments;
  @override
  void onInit()async {
    visitId = argumentData[0]['VisitId'] ;
    type = argumentData[0]['Type'] ;
    labOrRadOrRx=type=="Lab"?1:type=="Rad"?2:3;
    getResults();
    super.onInit();
  }

  getResults()async{
    results= await PatientApi.getResults(visitId!,type);
    isLoading=false;
    update();

  }



}