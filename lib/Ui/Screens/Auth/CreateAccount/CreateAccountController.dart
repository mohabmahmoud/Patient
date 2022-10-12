import 'package:get/get.dart';
import 'package:patient/Constants/customToast.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Data/Apis/auth_api.dart';
import 'package:patient/Data/Apis/patient_api.dart';
import 'package:patient/Data/Models/Patient/patient_app_model.dart';
import 'package:patient/Ui/Screens/Auth/CreateAccount/CreateAccount.dart';
import 'package:patient/Ui/Screens/Auth/Login/LoginScreen.dart';
import 'package:patient/Ui/SharedWidgets/Loading/Loading.dart';

class CreateAccountController extends GetxController{
  dynamic argumentData = Get.arguments;
  int ?patientId;
  bool isLoading=false;
  PatientApp patient=PatientApp();
  String phone="";
  @override
  void onInit()async{
    patientId = argumentData[0]['PatientId'];
    phone = argumentData[0]['Phone'];
    getPatientData();
    super.onInit();
  }
  getPatientData()async{
    if(patientId!=null) {
      isLoading=true;
      update();
      patient= await PatientApi.getPatientAppByPatientId(patientId!);
      patient.phone=phone;
      isLoading=false;
      update();
    }else{

      patient.phone=phone;
      update();
    }

  }
  createAccountNewAccount()async{
    showLoading();
    var createAccountStatus=await AuthApi.signUP(patient);
    hideLoading();
    if(createAccountStatus.isError){
      showFailedToast("error");
    }else{
      Get.offAll(const LoginScreen(),arguments: [{"Phone":patient.phone,"Password":patient.password}]);

    }

  }


  onChangeAge(age){
    int patientAge=0;
    try {
       patientAge = int.parse(age);
      DateTime patientBirthDate = DateTime(DateTime
          .now()
          .year - patientAge, DateTime
          .now()
          .month, DateTime
          .now()
          .day);
      patient.birthDate = patientBirthDate;
    }catch(e){
      patient.birthDate =null;
      patient.age =0;
    }
    update();
    patient.age=patientAge;
  }
  onChangeName(name){
    patient.fullName=name;

  }
  onChangeEmail(email){
    patient.email=email;

  }
  onChangePassword(password){
    patient.password=password;

  }
  onChangeGender(int gender){

    patient.gender=gender;
    update();

  }
  onChangeBirthDate(DateTime ?birthDate){
    patient.birthDate=birthDate!;
    patient.updateAge();
    update();

  }

}