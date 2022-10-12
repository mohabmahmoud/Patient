import 'package:intl/intl.dart';
import 'package:patient/Core/Helper/Helper.dart';

import '../../../../Core/Language/LangVariables.dart';

class DayModel{
  DateTime ?dateTimeDay;
  int ?status=0;
  int ?dayId=0;
  bool ?isSelect=false;
  DayModel.fromJson(Map<String ,dynamic> json){

    dayId= json["DayId"]??0;
    status= json["Status"]??0;
    dateTimeDay=Helper.dateTimeHelper.
    dateTimeFromString(json["DateTimeDay"]);


  }
  String getDay(){

    return dateTimeDay!.day.toString();
  }

  String getDayName(){
    return appDic[DateFormat('EEEE').format(dateTimeDay!)];
  }

  String getYear(){

    return "";
  }


}