
class DDModel {
  int id = 0;
  String name = "";
  String ?key = "";
  int? parentId = 0;

  DDModel({required this.id, required this.name, this.parentId, this.key});
  DDModel.fromJson(Map<String ,dynamic> json){
    print(json);
    name= json["Name"]??"";
    id= json["Id"]??0;


  }
}
