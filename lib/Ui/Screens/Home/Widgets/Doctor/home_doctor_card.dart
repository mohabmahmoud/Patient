
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Data/Models/Doctor/doctor_model.dart';
import 'package:patient/Ui/Screens/DoctorPage/doctor_page.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import '../../../../../Core/Helper/Helper.dart';
import '../../../../../Style/AppStyle.dart';
import '../../../../SharedWidgets/AppText.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


  Widget homeDoctorCard({required DoctorModel doctor, bool ?isFullScreen}) {
    return
    InkWell(onTap: (){

      Get.to(const DoctorPage(),arguments: [{"doctor":doctor}]);
    },child:
        Container(margin: EdgeInsets.symmetric(vertical:  Helper.outerPadding/2),padding: EdgeInsets.symmetric(horizontal: Helper.innerPadding),child:
        Material(borderRadius:BorderRadius.circular(Helper.borderRadius * 2),
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade50,child:
      SizedBox(

              width: isFullScreen==true?Helper.sW:(Helper.sW * .85),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Flexible(flex: 5,child:
                    Container(padding: EdgeInsets.all(Helper.borderRadius),child:
                    Material(elevation: .02,color: Colors.transparent,
                      borderRadius: BorderRadius.circular(Helper.borderRadius*3),
                      child:
                      Stack(children: [

                        doctor.image==null||doctor.image!.isEmpty?
                        Image.asset((doctor.sexId==1)?"Images/DoctorScreen/M_doctor.png":"Images/DoctorScreen/F_doctor.png",fit: BoxFit.fill,

                          height: Helper.sH/6.5,
                          width: Helper.sH/6.5,
                        ):

                        Image.network(
                          doctor.sexId==1?"https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg":
                          "https://images.theconversation.com/files/304957/original/file-20191203-66986-im7o5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop",
                          height: Helper.sH/6.5,
                          width: Helper.sH/6.5,
                          fit: BoxFit.fill,
                        ),
                        Positioned(bottom: 0,right: 0,left: 0,child:Container(
                          padding: EdgeInsets.symmetric(vertical: Helper.outerPadding/3),

                          decoration: MainBoxDecorationStyle(doctor.isGreen==true?AppStyle.green:AppStyle.red, 2),

                            child:

                            appText(text: doctor.availabilityLabel, textAlign: TextAlign.center,style: AppStyle.h5WhiteSemiBold)


                        )



                        )

                      ],)

                    ))
                    
                    
                    
                    ),
                    sizedWS(),
                    Flexible(flex: 8,child:Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                   sizedM(),
                   sizedS(),
                      appText( text: doctor.name,style: AppStyle.h3BlackSemiBold),
                      RatingBarIndicator(
                    rating: doctor.rate!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: Helper.iconS,
                    direction: Axis.horizontal,
                  ),
                      Row(children: [

                      Flexible(flex: 4,child:  appText(
                           text: doctor.speciality,
                           style: AppStyle.h4PrimaryBold)),



                     ],),


                      appText(
                          text: "الطبيب كما يُعرف بالاسم الأقل شيوعاً الآسي هو من درس علم الطب ومارسها. وهو يعاين المرضى ويشخص لهم المرض ويصرف لهم وصفة يكتب فيها الدواء. والطبيب بعد تخرجه يمارس الطب العام. وإذا استمر في دراسته يتخصص في مجال معين في الطب."
                              ,
                          maxLines: 3,
                          style: AppStyle.h5BlackLight),
                    ],))

                  ],),





            )))

    );
  }

