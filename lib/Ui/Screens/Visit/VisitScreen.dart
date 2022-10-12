import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Constants/paths.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/loader.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';
import '../MyVisits/Widgets/visitItem.dart';
import '../Results/patient_result_screen.dart';
import 'Widget/result_item.dart';
import 'visit_screen_controller.dart';

class VisitScreen extends StatefulWidget {
  const VisitScreen({Key? key}) : super(key: key);

  @override
  State<VisitScreen> createState() => _VisitScreenState();
}

class _VisitScreenState extends State<VisitScreen> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<VisitScreenController>(
        init: VisitScreenController(),
    builder: (ctr) {

    return screenDiraction(child: Scaffold(appBar: AppBar(elevation: .8,centerTitle: false,title:
     appText(text: appDic["Visit Details"],style: AppStyle.h1BlackBold)),body:

    Container(color: AppStyle.shadowColor,child:
    ListView(children: [
      visitItem(visit:ctr.visit!,showBtn: false,),


      Padding(padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding),child:
      Column(crossAxisAlignment: CrossAxisAlignment
          .start
        ,children: [
          Material(color: AppStyle.white,elevation: 15,borderRadius: BorderRadius.circular(Helper.borderRadius),child:

              ctr.rateLoading?
                  Column(children: [
                    sizedM(),
                    const Loader(),
                    sizedM(),


                  ],):

        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          sizedL(),
          Padding(padding:EdgeInsets.symmetric(horizontal: Helper.outerPadding*2),
              child:appText(text: appDic["Rate Visit Doctor"], style:AppStyle.h2BlackBold)),
          const Divider(),
              Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Flexible(flex: 3,child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  (ctr.rate==null)?RatingBar.builder(
                    initialRating: ctr.rateFromBar,
                    minRating: 1,
                    itemSize: Helper.iconL*1.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,


                    itemCount: 5,

                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: Helper.iconM,
                    ),
                    onRatingUpdate: (rating) {
                      ctr.onchangeRating(rating);
                    },

                  ):
                RatingBarIndicator(
                rating: ctr.rate!,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: Helper.iconL*1.5,
                direction: Axis.horizontal,
              )
               ,




                  sizedS(),
                  Padding(padding: EdgeInsets.symmetric(horizontal: Helper.innerPadding*2),child:Row(children: [
                    Flexible(flex: 1,child:appText(text: "${appDic["Doctor"]} ", style: AppStyle.h3GreySemiBold)),
                    Flexible(flex: 2,child: appText(text: ctr.visit!.doctorName, maxLines: 1,style: AppStyle.h2PrimarySemiBold)),

                  ],)),


                ],)),

                Flexible(flex: 1,child:Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [
                     Icon(
                      Icons.star_rounded,
                      color: AppStyle.amber,
                      size: Helper.iconL,
                    ),
                    appText(
                        text: "(${ctr.rateFromBar})",
                        style:
                        AppStyle.h3AmberSemiBold)
                  ],
                ))


                  ],),
          const Divider(),


          Padding(padding:EdgeInsets.symmetric(horizontal: Helper.outerPadding) ,child:AppButton(color: AppStyle.green,
              textColor: AppStyle.black, text: appDic["Save Rate"], onPressed:ctr.rate!=null?null:(){

                ctr.ratingDoctor();

              })),
          sizedM(),

        ],)
),
          sizedM(),
          Material(color: AppStyle.white,elevation: 15,borderRadius: BorderRadius.circular(Helper.borderRadius),child:

        Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          sizedL(),
          Padding(padding:EdgeInsets.symmetric(horizontal: Helper.outerPadding*2),
              child:appText(text: appDic["Results And Rx"], style:AppStyle.h2BlackBold)),
         const Divider(),
          Row(children: [
            sizedWS(),
            resultItem(title: appDic["Lab-Results"], image: labImage, onTap: (){
              Get.to(const ResultScreen(),arguments: [{"VisitId":ctr.visit!.visitId,"Type":"Lab"}]);
            }),



            resultItem(title: appDic["Rad-Results"], image: radImage, onTap: (){
              Get.to(const ResultScreen(),arguments: [{"VisitId":ctr.visit!.visitId,"Type":"Rad"}]);
            }),


            resultItem(title: appDic["Rx-Results"], image: rxImage, onTap: (){
              Get.to(const ResultScreen(),arguments: [{"VisitId":ctr.visit!.visitId,"Type":"Rx"}]);
            }),
            sizedWS(),
          ],),
          sizedM(),

        ],)
),

      ],)

      )

    ],)


    ),),);
    });
  }
}
