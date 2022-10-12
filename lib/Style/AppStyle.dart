

import 'package:flutter/material.dart';
import '../Constants/color.dart';
import '../Core/Helper/Helper.dart';

class AppStyle {
  static  Color primaryColor = HexColor('#14457b');
  static Color green = HexColor('#38a73f');
  static  Color accentColors = HexColor('#2490eb');
  static const Color white = Colors.white;
  static const Color black = Colors.black87;
  static const Color grey = Colors.grey;
  static const Color red = Colors.redAccent;
  static const Color amber = Colors.amberAccent;
  static  Color shadowColor = Colors.grey.withOpacity(.07 );


  static const FontWeight fontWeightBold = FontWeight.w800;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightLight = FontWeight.w500;



  static TextStyle Title = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: black,fontSize:Helper.h0, fontWeight: fontWeightBold);


  static TextStyle h0BlackBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: black,fontSize:Helper.h0, fontWeight: fontWeightBold);
  static TextStyle h0BlackSemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: black,fontSize:Helper.h0, fontWeight: fontWeightSemiBold);
  static TextStyle h0RedSemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: red,fontSize:Helper.h0, fontWeight: fontWeightSemiBold);


  static TextStyle h1BlackBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: black,fontSize:Helper.h1, fontWeight: fontWeightBold);
  static TextStyle h1AccentBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: accentColors,fontSize:Helper.h1, fontWeight: fontWeightBold);
  static TextStyle h1PrimaryBold =Theme.of(Helper.materialKey.currentContext!).textTheme .headline5!.copyWith(color: primaryColor,fontSize:Helper.h1,  fontWeight: fontWeightBold);
  static TextStyle h1PrimarySemiBold =Theme.of(Helper.materialKey.currentContext!) .textTheme.headline5!.copyWith(color: primaryColor, fontSize:Helper.h1, fontWeight: fontWeightSemiBold);
  static TextStyle h1WhiteBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5! .copyWith(color: white, fontSize:Helper.h1, fontWeight: fontWeightBold);
  static TextStyle h1WhiteLight = Theme.of(Helper.materialKey.currentContext!) .textTheme.headline5!.copyWith(color: white, fontSize:Helper.h1, fontWeight: fontWeightLight);
  static TextStyle h1GreySemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline5! .copyWith(color: grey, fontSize:Helper.h1, fontWeight: fontWeightSemiBold);
  static TextStyle h1BlackSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline5! .copyWith(color: black, fontSize:Helper.h1, fontWeight: fontWeightSemiBold);
  static TextStyle h1AmberSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme .headline5! .copyWith(color: amber,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);
  static TextStyle h1RedSemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline5!.copyWith(color: red,fontSize:Helper.h1, fontWeight: fontWeightSemiBold);


  static TextStyle h2PrimarySemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: primaryColor,fontSize:Helper.h2,  fontWeight: fontWeightSemiBold);
  static TextStyle h2RedLight =Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: red, fontSize:Helper.h2, fontWeight: fontWeightLight);
  static TextStyle h2PrimaryLight =Theme.of(Helper.materialKey.currentContext!).textTheme .headline6!.copyWith(color: primaryColor,fontSize:Helper.h2,  fontWeight: fontWeightLight);
  static TextStyle h2PrimaryBold =Theme.of(Helper.materialKey.currentContext!).textTheme .headline6!.copyWith(color: primaryColor,fontSize:Helper.h2,  fontWeight: fontWeightBold);
  static TextStyle h2WhiteSemiBold =Theme.of(Helper.materialKey.currentContext!).textTheme.headline6! .copyWith(color: white, fontSize:Helper.h2, fontWeight: fontWeightSemiBold);
  static TextStyle h2WhiteLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: white, fontSize:Helper.h2, fontWeight: fontWeightLight);
  static TextStyle h2GreyLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: grey, fontSize:Helper.h2, fontWeight: fontWeightLight);
  static TextStyle h2GreySemiBold =Theme.of(Helper.materialKey.currentContext!) .textTheme.headline6!.copyWith(color: grey,fontSize:Helper.h2,  fontWeight: fontWeightSemiBold);
  static TextStyle h2BlackBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: black, fontSize:Helper.h2, fontWeight: fontWeightBold);
  static TextStyle h2BlackSemiBold =Theme.of(Helper.materialKey.currentContext!).textTheme .headline6!.copyWith(color: black,fontSize:Helper.h2,  fontWeight: fontWeightSemiBold);
  static TextStyle h2BlackLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: black,fontSize:Helper.h2,  fontWeight: fontWeightLight);

  static TextStyle h3PrimarySemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme .headline6! .copyWith(color: primaryColor,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);
  static TextStyle h3PrimaryBold = Theme.of(Helper.materialKey.currentContext!).textTheme .headline6! .copyWith(color: primaryColor,fontSize:Helper.h3, fontWeight: fontWeightBold);
  static TextStyle h3GreyLight = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: grey,fontSize:Helper.h3, fontWeight: fontWeightLight);
  static TextStyle h3PrimaryLight = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: primaryColor,fontSize:Helper.h3, fontWeight: fontWeightLight);
  static TextStyle h3BlackLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: black,fontSize:Helper.h3, fontWeight: fontWeightLight);
  static TextStyle h3BlackSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: black,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);
  static TextStyle h3AccentSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: accentColors,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);
  static TextStyle h3BlackBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: black, fontSize:Helper.h3,fontWeight: fontWeightBold);
  static TextStyle h3WhiteBold = Theme.of(Helper.materialKey.currentContext!).textTheme.headline6!.copyWith(color: white, fontSize:Helper.h3,fontWeight: fontWeightBold);
  static TextStyle h3WhiteSemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: white,fontSize:Helper.h3, fontWeight: fontWeightBold);
  static TextStyle h3WhiteLight = Theme.of(Helper.materialKey.currentContext!)  .textTheme .headline6!.copyWith(color: white,fontSize:Helper.h3, fontWeight: fontWeightLight);
  static TextStyle h3GreySemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: grey,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);
  static TextStyle h3RedSemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: red,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);
  static TextStyle h3RedLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: red,fontSize:Helper.h3, fontWeight: fontWeightLight);
  static TextStyle h3GreenLight = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: green,fontSize:Helper.h3, fontWeight: fontWeightLight);
  static TextStyle h3AmberSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme .headline6! .copyWith(color: amber,fontSize:Helper.h3, fontWeight: fontWeightSemiBold);


  static TextStyle h4PrimaryLight =Theme.of(Helper.materialKey.currentContext!) .textTheme .subtitle2! .copyWith(color: primaryColor,fontSize:Helper.h4, fontWeight: fontWeightLight);
  static TextStyle h4PrimarySemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: primaryColor,fontSize:Helper.h4, fontWeight: fontWeightSemiBold);
  static TextStyle h4PrimaryBold = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: primaryColor,fontSize:Helper.h4, fontWeight: fontWeightBold);
  static TextStyle h4GreenSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme  .subtitle2! .copyWith(color: green,fontSize:Helper.h4, fontWeight: fontWeightSemiBold);
  static TextStyle h4AccentSemiBold = Theme.of(Helper.materialKey.currentContext!).textTheme  .subtitle2! .copyWith(color: accentColors,fontSize:Helper.h4, fontWeight: fontWeightSemiBold);
  static TextStyle h4BlackSemiBold =  Theme.of(Helper.materialKey.currentContext!).textTheme .subtitle2!.copyWith(color: black,fontSize:Helper.h4, fontWeight: fontWeightSemiBold);
  static TextStyle h4BlackLight = Theme.of(Helper.materialKey.currentContext!) .textTheme  .subtitle2! .copyWith(color: black,fontSize:Helper.h4, fontWeight: fontWeightLight);
  static TextStyle h4BlackBold =  Theme.of(Helper.materialKey.currentContext!).textTheme .subtitle2!.copyWith(color: black,fontSize:Helper.h4, fontWeight: fontWeightBold);
  static TextStyle h4WhiteSemiBold =Theme.of(Helper.materialKey.currentContext!)   .textTheme .subtitle2!.copyWith(color: white,fontSize:Helper.h4, fontWeight: fontWeightSemiBold);
  static TextStyle h4GreyLight = Theme.of(Helper.materialKey.currentContext!) .textTheme.subtitle2!.copyWith(color: grey,fontSize:Helper.h4, fontWeight: fontWeightLight);
  static TextStyle h4GreySemiBold =Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: grey,fontSize:Helper.h4, fontWeight: fontWeightSemiBold);
  static TextStyle h4GreenLight = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: green,fontSize:Helper.h4, fontWeight: fontWeightLight);
  static TextStyle h4RedLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .headline6!.copyWith(color: red,fontSize:Helper.h4, fontWeight: fontWeightLight);


  static TextStyle h5PrimaryLight =Theme.of(Helper.materialKey.currentContext!).textTheme .subtitle2! .copyWith(color: primaryColor,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5PrimarySemiBold =Theme.of(Helper.materialKey.currentContext!) .textTheme.subtitle2!.copyWith(color: primaryColor,fontSize:Helper.h5, fontWeight: fontWeightSemiBold);
  static TextStyle h5PrimaryBold =Theme.of(Helper.materialKey.currentContext!) .textTheme.subtitle2!.copyWith(color: primaryColor,fontSize:Helper.h5, fontWeight: fontWeightBold);
  static TextStyle h5BlackLight = Theme.of(Helper.materialKey.currentContext!) .textTheme  .subtitle2! .copyWith(color: black,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5GreenLight = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: green,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5AccentLight = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: accentColors,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5BlackSemiBold =Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2! .copyWith(color: black,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5BlackBold =Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2! .copyWith(color: black,fontSize:Helper.h5, fontWeight: fontWeightBold);
  static TextStyle h5WhiteSemiBold =Theme.of(Helper.materialKey.currentContext!).textTheme .subtitle2!  .copyWith(color: white,fontSize:Helper.h5, fontWeight: fontWeightSemiBold);
  static TextStyle h5WhiteBold =Theme.of(Helper.materialKey.currentContext!).textTheme .subtitle2!  .copyWith(color: white,fontSize:Helper.h5, fontWeight: fontWeightBold);
  static TextStyle h5WhiteLight = Theme.of(Helper.materialKey.currentContext!) .textTheme.subtitle2! .copyWith(color: white,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5RedLight = Theme.of(Helper.materialKey.currentContext!) .textTheme .subtitle2!.copyWith(color: red,fontSize:Helper.h5, fontWeight: fontWeightLight);
  static TextStyle h5GreySemiBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .subtitle2! .copyWith(color: grey,fontSize:Helper.h5, fontWeight: fontWeightSemiBold);
  static TextStyle h5GreyBold = Theme.of(Helper.materialKey.currentContext!) .textTheme .subtitle2! .copyWith(color: grey,fontSize:Helper.h5, fontWeight: fontWeightBold);
  static TextStyle h5GreyLight = Theme.of(Helper.materialKey.currentContext!).textTheme.subtitle2!.copyWith(color: grey,fontSize:Helper.h5, fontWeight: fontWeightLight);
}
