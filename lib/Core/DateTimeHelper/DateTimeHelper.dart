import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient/Core/Language/LangVariables.dart';

class DateTimeHelper{

int getEndDate(DateTime date) {
  return date
      .add(const Duration(hours: 5))
      .millisecondsSinceEpoch +
      1000 * 30;
}

String timeToString(TimeOfDay time) {
  String hour = time.hour < 10 ? "0${time.hour}" : "${time.hour}";
  String minute = time.minute < 10 ? "0${time.minute}" : "${time.minute}";
  if (hour == '12' && time.period.name == "pm") {
    if (minute == "00") {
      minute = "59";
      hour = "23";
    } else {
      hour = "12";
    }
  }


  return "$hour:$minute:00";
}

String timeFromDate(DateTime date) {
  String isPm="Am";
String hour=date.hour.toString();
  String minute=date.minute.toString();
if(date.hour>11){
  isPm="Pm";

}
if(hour.length==1){
  hour="0$hour";

}

  if(minute.length==1){
    minute="0$minute";

  }


  return "${date.hour}:${date.minute} ${appDic["Pm"]}";
}


TimeOfDay timeOfFromString(String time) {
  return TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]));
}

DateTime dateTimeFromString(String date) {
  return DateTime.parse(date);
}

String dateToString (DateTime date) {
  return "${date.year}/${date.month}/${date.day}";
}

String getMonthName(DateTime dT) {
  List months =
  ['jan', 'feb', 'mar', 'apr', 'may','jun','jul','aug','sep','oct','nov','dec'];

  int currentMonth = dT.month;
  return  appDic['${months[currentMonth-1]}'];

}

String getDayName(DateTime dT){
  return appDic[DateFormat('EEEE').format(dT)];
}
}