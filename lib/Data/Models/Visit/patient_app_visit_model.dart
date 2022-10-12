import 'package:patient/Core/Helper/Helper.dart';

class PatientAppVisitModel
{
   int ?visitId ;
   String ?doctorName ;
   String ?company ;
   DateTime ?visitStartDate;
   String ?visitNumber  ;
   String ?clinicName ;


   PatientAppVisitModel.fromJson(Map<String, dynamic> json) {
     visitId=json['VisitId'];
     doctorName=json['DoctorName'];
     company=json['Company'];
     visitStartDate=Helper.dateTimeHelper.dateTimeFromString(json['VisitStartDate']);
     visitNumber=json['VisitNumber']??"";
     clinicName=json['ClinicName'];

   }


}