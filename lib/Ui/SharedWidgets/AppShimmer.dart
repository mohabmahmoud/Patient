import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget appShimmer({required double height,required double width,required int lines}){

  return
    SizedBox(
        height: height,
        width:width,
        child:

        SkeletonLine(
          style: SkeletonLineStyle(
              height: height,
              width:width,
              borderRadius: BorderRadius.circular(8)),
        )
        ) ;

}