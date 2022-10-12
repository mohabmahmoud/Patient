class SpecialityModel{
  int ?id;
  String name="";
  String image="";
  SpecialityModel.fromJson(Map<String ,dynamic> json){

    image=json["Image"]??"";
    name= json["Name"]??"";
    id= json["Id"]??"";


  }
}