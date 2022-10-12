class PhoneConfirmationResponse
{
   int ?phoneConfirmationId;
   String  ?message;
   String  ?phone;
   int ? patientId;
   bool ?toNext;
   bool ?dialog;
   PhoneConfirmationResponse();
   PhoneConfirmationResponse.fromJson(Map<String, dynamic> json) {
       phoneConfirmationId=json['PhoneConfirmationId'];
       message=json['Message'];
       patientId=json['PatientId'];
       toNext=json['ToNext'];
       dialog=json['Dialog'];
       phone=json['Phone'];
     }


}