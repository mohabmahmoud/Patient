import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/widthAndHeight.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Style/AppStyle.dart';

import '../../../Constants/paths.dart';
import '../../SharedWidgets/SizedBoxes.dart';
import 'SplashController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<SplashController>(
        init: SplashController(),
    builder: (ctr) {
   return Scaffold(appBar: AppBar(backgroundColor: AppStyle.primaryColor,centerTitle: true,title:const Text("Book an appointment",style: TextStyle(fontSize: 22,color: AppStyle.white)),),backgroundColor: AppStyle.white,body:
    Center(child:Image.asset(splash,width:getWidth(context),)),
     bottomNavigationBar: SizedBox(height: getHeight(context)/7,child:
    Column(children: [
    const Divider(),
    sizedL(),
    Padding(padding: const EdgeInsets.all(10),child:Image.asset(footer,width:getWidth(context)/2,)),
    ],)


    ), );
    });
  }
}
