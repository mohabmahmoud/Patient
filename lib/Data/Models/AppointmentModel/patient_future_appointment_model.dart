import 'package:patient/Core/Helper/Helper.dart';

class PatientFutureAppointmentModel
{
 int ?id ;
 String ?clinicName ; 
 String ?doctorName; 
 String ?slot; 
 DateTime ?appointmentDate ; 
 String ?serviceName ;
 String ?status ;
 PatientFutureAppointmentModel.fromJson(Map<String, dynamic> json) {
     id=json['Id'];
     serviceName=json['ServiceName'];
     doctorName=json['DoctorName'];
     slot=json['Slot'];
     clinicName=json['ClinicName'];
     status=json['Status'];
     print(json['AppointmentDate']);
     appointmentDate=Helper.dateTimeHelper.dateTimeFromString(json['AppointmentDate']);


   }

}
       