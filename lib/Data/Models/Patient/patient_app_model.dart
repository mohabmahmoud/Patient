import 'package:patient/Core/Helper/Helper.dart';

class PatientApp {
    int ?id;
    int ?patientId ;
    String ?fullName ;
    String ?email="";
    String ?phone;
    String ?password="";
    int ?gender ;
    DateTime ?birthDate ;
    int age=0;

  PatientApp();
  PatientApp.fromJson(Map<String, dynamic> json) {
    id=json['Id'];
    patientId=json['PatientId'];
    fullName=json['FullName'];
    phone=json['Phone'];
    email=json['Email']??"";
    gender=json['Gender'];

    birthDate=Helper.dateTimeHelper.dateTimeFromString(json['BirthDate']??DateTime.now().toString());
    updateAge();

  }
  updateAge(){
    if(birthDate!=null){
      age=DateTime.now().year-birthDate!.year;
    }
  }
  Map<String, dynamic> toJson() {

      return {
        "patientId": patientId,
        'fullName': fullName,
        "email":email,
        "phone":phone,
        "Password":password,
        "gender":gender,
        "birthDate":Helper.dateTimeHelper.dateToString(birthDate!),
      };







    }

}