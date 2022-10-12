import 'dart:io';
import 'package:flutter/material.dart';
import 'package:patient/Style/AppStyle.dart';
import '../../Core/Helper/Helper.dart';
import 'AppText.dart';

Container importImage(
    {
      required onClick,
      String hint = "",
      double ?height,
      double ?width,
      File ?imageFile ,
      String ?imagePath

    }) {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.12), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
      ),
      height: height??90,
      width:width??90 ,
      child:
      InkWell(onTap:onClick ,child:
      (imageFile!=null)?Image.file(imageFile):
      (imagePath!=null&&imagePath.isNotEmpty)?
      Image.network("${Helper.aPI.baseUrl}/$imagePath"):
      Padding(
          padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding),
          child:
          Column(mainAxisAlignment: MainAxisAlignment.center,children: [
            Icon(Icons.image_outlined,color:Colors.black.withOpacity(0.12) ,size: height!=null?height-70:50,),
            appText(text: hint,style: AppStyle.h1BlackBold.copyWith(color:Colors.black.withOpacity(0.12) ))


          ],)


      ),

      )

      ,
    );



}