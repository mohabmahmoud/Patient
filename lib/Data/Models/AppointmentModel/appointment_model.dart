import '../../../Core/Helper/Helper.dart';

class AppointmentModel {
  int ?id;

  int ?clinicId = 0;
  int ?doctorId = 0;
  String ?slot = "";
  int ?serviceId = 0;
  DateTime ?appointmentDate;

  Map<String, dynamic> toJson() {
    return {
      "ClinicId": clinicId,
      "DoctorId": doctorId,
      "SlotString": slot,
      "ServiceId": serviceId,
      "AppointmentDate": Helper.dateTimeHelper.dateToString(appointmentDate!),
    }
    ;
  }
}