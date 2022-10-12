import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient/Ui/Screens/Splash/SplashScreen.dart';
import 'package:patient/main.dart';
import '../Storage/StorageHelper.dart';
import 'Lang.dart';
import 'LangVariables.dart';

class LangHelper{
  static List<Lang> languages=[
    Lang(id: 1,direction: TextDirection.rtl, font:"MainFont",languageName: "Arabic" ,shortName: 'ar'),
    Lang(id:2, direction: TextDirection.ltr,font:"MainFontEn",languageName: "English",shortName:'en'),
  ];
  static initLanguage() async{
    Lang ?langObj;
    if (StorageHelper.readStorage('Lang') != null) {
      langObj=languages.
      firstWhere((element) => element.id==StorageHelper.readStorage('Lang'));

    } else {

      if((window.locale.languageCode == 'ar')) {
         langObj = languages
            .where((element) => element.id ==1)
            .toList()
            .first;
         StorageHelper.writeStorageInt('Lang',1);
      }
      else{
         langObj = languages.firstWhere((element) => element.id ==2);
         StorageHelper.writeStorageInt('Lang',2);

      }
    }
    appDic=json.decode(await rootBundle.loadString("Dic/${langObj.shortName}.json"));
    direction=langObj.direction;
    langShortName=langObj.shortName;
    appFont=langObj.font;
  }

  static changeLanguage(int langId){
    StorageHelper.writeStorageInt('Lang',langId);
    main();
  }

  static String getLangFont(){
    if (StorageHelper.readStorage('Lang') != null) {
      return languages.firstWhere((element) => element.id==StorageHelper.readStorage('Lang')).font;

    }
    return languages.firstWhere((element) => element.shortName==window.locale.languageCode).font;

  }

}