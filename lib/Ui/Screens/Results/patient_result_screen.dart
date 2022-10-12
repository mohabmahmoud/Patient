import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';
import 'Widgets/result_widget.dart';
import 'lab_result_controller.dart';
class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<LabResultController>(
        init: LabResultController(),
    builder: (ctr) {
      return screenDiraction(child: Scaffold(appBar:
      AppBar(elevation: 1,centerTitle: true,title:
      Text(appDic["${ctr.type}-Results"]),),body:
    ListView.builder(shrinkWrap: true,itemCount: ctr.results.length,itemBuilder: (context, index) {
      return resultWidget(ctr.results[index],ctr.labOrRadOrRx);
    },)

      ,));});
  }
}
