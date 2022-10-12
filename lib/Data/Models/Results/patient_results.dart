import 'package:patient/Core/Helper/Helper.dart';

class PatientResults{
   int ?id ;
   String ?serviceName ;
   String ?doneDoctorName;
   DateTime ?resultDate ;
   PatientResults.fromJson(Map<String, dynamic> json) {
     id=json['Id'];
     serviceName=json['ServiceName'];
     doneDoctorName=json['DoneDoctorName'];
     resultDate=Helper.dateTimeHelper.dateTimeFromString(json['ResultDate']);}

}