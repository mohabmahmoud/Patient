

import 'package:flutter/cupertino.dart';
import 'package:patient/Core/DateTimeHelper/DateTimeHelper.dart';
import 'package:patient/Data/DataSource/base_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Constants/widthAndHeight.dart';
import '../Language/LangHelper.dart';
import '../Storage/StorageHelper.dart';
import 'Responsive.dart';

class Helper {
  static double sW = 0;
  static double sH = 0;
  static double h0 = 0;
  static double h1 = 0;
  static double h2 = 0;
  static double h3 = 0;
  static double h4 = 0;
  static double h5 = 0;
  static double itemsHeight = 0;
  static double outerPadding = 0;
  static double innerPadding = 0;
  static double borderRadius = 0;
  static double iconS = 0;
  static double iconM = 0;
  static double iconL = 0;
  static double spaceS = 0;
  static double spaceM = 0;
  static double spaceL = 0;
  static int screenSize = 1; //large=1 medium=2 small=3

  static BaseAPI aPI=  BaseAPI();
  static DateTimeHelper dateTimeHelper=DateTimeHelper();

  static GlobalKey<NavigatorState> materialKey = GlobalKey();
  static final Helper _singleton = Helper()._internal();
  factory Helper() {
    return _singleton;
  }
  _internal() {}

  static helperInit() async {
    StorageHelper.storage = await SharedPreferences.getInstance();
    Helper.sW = getWidth(materialKey.currentContext!);
    Helper.sH = getHeight(materialKey.currentContext!);
    LangHelper.initLanguage();
    double pixelRatio = MediaQuery.of(materialKey.currentContext!).devicePixelRatio;
    bool large = Responsive.isScreenLarge(Helper.sW, pixelRatio);
    if (large) {
      Helper.h0 = 24;
      Helper.h1 = 21;
      Helper.h2 = 18.5;
      Helper.h3 = 17;
      Helper.h4 = 16.5;
      Helper.h5 = 15;
      Helper.itemsHeight = 68;
      Helper.outerPadding = 13;
      Helper.innerPadding = 7;
      Helper.borderRadius =12;
      Helper.spaceS = 8;
      Helper.spaceM = 16;
      Helper.spaceL = 32;

    }
    bool medium = Responsive.isScreenMedium(Helper.sW, pixelRatio);
    if (medium) {
      Helper.h0 = 25;
      Helper.h1 = 21;
      Helper.h2 = 19;
      Helper.h3 = 17;
      Helper.h4 = 16;
      Helper.h5 = 15;
      Helper.itemsHeight = 65;
      Helper.outerPadding = 12;
      Helper.innerPadding = 6;
      Helper.borderRadius =10;
      Helper.iconS = 20;
      Helper.iconM = 25;
      Helper.iconL = 28;
      Helper.spaceS = 8;
      Helper.spaceM = 12;
      Helper.spaceL = 20;

    }
    else if (!large && !medium) {
      Helper.h0 = 21;
      Helper.h1 = 18;
      Helper.h2 = 16.5;
      Helper.h3 = 14.2;
      Helper.h4 = 12.6;
      Helper.h5 = 11;
      Helper.itemsHeight = 60;
      Helper.outerPadding = 8;
      Helper.innerPadding = 4;
      Helper.borderRadius = 6;
      Helper.spaceS = 6;
      Helper.spaceM = 8;
      Helper.spaceL = 16;
      Helper.iconS = 17;
      Helper.iconM = 20;
      Helper.iconL = 25;

    }
    return 1;
  }



}
