import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Core/Language/LangVariables.dart';
import 'AppStyle.dart';


class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColorDark: Colors.black87,
    primaryColor: PrimaryColor,
    fontFamily: appFont,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    shadowColor: AppStyle.accentColors.withOpacity(.3),
    appBarTheme: AppBarTheme(
       color: AppStyle.white,

      titleTextStyle:  TextStyle(fontFamily: appFont,color: AppStyle.black, fontSize:20, fontWeight: AppStyle.fontWeightSemiBold),
      elevation: 0.0,
      shadowColor: AppStyle.accentColors.withOpacity(.3),
      iconTheme:  const IconThemeData(
        color: AppStyle.black,
        size: 32,
        opacity: .7,
        shadows: [Shadow(color: AppStyle.grey,blurRadius: 2,offset: Offset(0, 0))]
      ),
    ),
  );
}
