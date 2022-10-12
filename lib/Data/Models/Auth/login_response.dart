class LoginResponse{
  String  ?token;
  String  ?userName;
  String  ?msg;
  bool ?isError;

  LoginResponse();
  LoginResponse.fromJson(Map<String, dynamic> json) {
    isError=json['IsError']??true;
    token=json['Token']??"";
    userName=json['UserName']??"";
    msg=json['Msg']??"";
    if(msg==""){

      msg=json["Message"];
    }
  }


}