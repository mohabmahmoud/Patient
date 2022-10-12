
import 'package:flutter/material.dart';
import 'package:patient/Style/AppStyle.dart';
import '../../Core/Helper/Helper.dart';
Icon iconS({required IconData icon,Color ?clr}) =>  Icon(icon,color: clr??AppStyle.black,size: Helper.iconS);
Icon iconM({required IconData icon,Color ?clr}) =>  Icon(icon,color: clr??AppStyle.black,size: Helper.iconM,);
Icon iconL({required IconData icon,Color ?clr}) =>  Icon(icon,color: clr??AppStyle.black,size: Helper.iconL);
