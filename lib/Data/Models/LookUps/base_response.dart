class AppBaseResponse
{
   bool isError =false;
   String errorMessage="";
   String successMessage="";
   AppBaseResponse.fromJson(Map<String ,dynamic> json){

     isError=json["IsError"]??false;
     errorMessage= json["ErrorMessage"]??"";
     successMessage= json["SuccessMessage"]??"";


   }
}