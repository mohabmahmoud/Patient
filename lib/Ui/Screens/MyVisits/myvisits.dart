import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Style/AppStyle.dart';
import '../../SharedWidgets/AppText.dart';
import '../../SharedWidgets/screenDiraction.dart';
import 'myvisits_controller.dart';
import 'Widgets/visitItem.dart';

class MyVisits extends StatefulWidget {
  const MyVisits({Key? key}) : super(key: key);

  @override
  State<MyVisits> createState() => _MyVisitsState();
}

class _MyVisitsState extends State<MyVisits> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<MyVisitsController>(
        init: MyVisitsController(),
    builder: (ctr) {
    return screenDiraction(child:Scaffold(appBar: AppBar(elevation: 1,centerTitle: false,title: appText(text: appDic["Visits"], style: AppStyle.Title)),
    body:
    ListView(physics: const NeverScrollableScrollPhysics(),children: [

Column(children:
      List.generate(ctr.visits.length, (index) {
        return visitItem(visit:ctr.visits[index]);
      }))



    ])

    ,
    ));
    });
  }
}
