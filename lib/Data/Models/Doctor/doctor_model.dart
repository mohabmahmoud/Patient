class DoctorModel{
 int ?id ;
 String ?name="" ;
 String ?description="";
 String ?image="" ;
 double ?rate=0.0 ;
 String ?speciality="" ;
 String ?availabilityLabel="";
 bool ?isGreen=false ;
 int ?sexId;
 DoctorModel();
 DoctorModel.fromJson(Map<String, dynamic> json) {
  id=json['Id'];
  name=json['Name'];
  description=json['Description'];
  image=json['Image']??"";
  rate=json['Rate']??0.0;
  speciality=json['Speciality']??"";
  availabilityLabel=json['AvailabilityLabel']??"";
  isGreen=json['IsGreen']??"";
  sexId=json["SexId"]??1;

 }
}