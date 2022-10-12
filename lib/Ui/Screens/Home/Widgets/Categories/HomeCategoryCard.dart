import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Data/Models/LookUps/speciality_model.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import '../../../../../Constants/constants.dart';
import '../../../../../Style/AppStyle.dart';
import '../../../../SharedWidgets/AppText.dart';


  Widget homeCategoryCard(SpecialityModel sp,int index) {
    return Container(padding: const EdgeInsets.all(4),child:
          Material(borderRadius: BorderRadius.circular(Helper.borderRadius*4),color:Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(.07 ),child:

        SizedBox(height: 100,width: 100,

            child:Padding(padding: const EdgeInsets.all(8),child:
                Column(children: [
                  Image.asset("Images/Home/Sp/${index%11}.png",color: AppStyle.accentColors,height: 40),
                  sizedS(),
                  appText(text: sp.name,maxLines: 2,textAlign: TextAlign.center,style:AppStyle.h4BlackLight)

                ],)
            )
        )),







      );
  }

