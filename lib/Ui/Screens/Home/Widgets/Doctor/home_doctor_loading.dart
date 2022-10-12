import 'package:flutter/material.dart';
import '../../../../../Core/Helper/Helper.dart';
import '../../../../SharedWidgets/AppShimmer.dart';
import '../../../../SharedWidgets/SizedBoxes.dart';

Widget homeDoctorLoading({bool ?isVertical}){

  final cards = <Widget>[];
  Widget cardsWidget;

    for (int i = 0; i < 8; i++) {
      cards.add( Card(elevation: .2,child:
      Container(

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(Helper.borderRadius * 5)),
          width: isVertical==true?(Helper.sW *.99):(Helper.sW *.8),
          child:Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,children: [


              Flexible(flex: 5,child: appShimmer(lines: 1,height:Helper.sH /7-5,width:(Helper.sW *.8)  ),),
              const Flexible(flex: 1,child:SizedBox(width: 4,)),
              Flexible(flex: 7,child:Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                appShimmer(lines: 1,height:18,width:(Helper.sW * 2 / 3)-10  ),
                sizedS(),
                appShimmer(lines: 1,height:15,width:(Helper.sW * 2 / 3)-10  ),
                sizedS(),
                appShimmer(lines: 1,height:12,width:(Helper.sW * 2 / 3)-10  ),
                sizedS(),
                appShimmer(lines: 1,height:12,width:(Helper.sW * 2 / 3)-10  ),
                sizedS(),
                appShimmer(lines: 1,height:12,width:(Helper.sW * 2 / 3)-10  ),
              ],))

            ],),
          ],)


      )),);
    }

    cardsWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection:(isVertical==true)?Axis.vertical: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child:(isVertical==true)?Column(children: cards):Row(children: cards),
        ),
      ],
    );

  return cardsWidget;

}