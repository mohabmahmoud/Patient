
class TimeSlot{
 int ?id ;
 String ?from;
 String ?to ;
 int ? state ;
 TimeSlot();
 TimeSlot.fromJson(Map<String ,dynamic> json){
   print(json);
   id= json["Id"]??0;
   from= json["From"]??"0";
   to= json["To"]??"";
   state= json["State"]??0;


 }
}