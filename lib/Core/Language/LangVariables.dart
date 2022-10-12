import 'dart:ui';

Map<String ,dynamic> appDic=<String ,String>{};
TextDirection direction=TextDirection.rtl;
String langShortName="ar";
String appFont="MainFont";

String getDicText(String key){
  return appDic[key]??key;
}