import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/paths.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Ui/Screens/More/more_screen.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';

import '../../../Data/CachedData/cached_user_data.dart';
import '../../../Style/AppStyle.dart';
import '../Home/Homepage.dart';
import '../MyVisits/myvisits.dart';
import '../Search/search_screen.dart';


class Taps extends StatefulWidget {
  const Taps({Key? key}) : super(key: key);


  @override
  _TapsState createState() => _TapsState();
}

class _TapsState extends State<Taps> {

  List screens=[
    const HomePage(),
    const MyVisits(),
    SearchScreen( title: appDic["Doctors"],showFilter: true),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return
      screenDiraction(child:
      Obx(() => Scaffold(body:screens[CachedSessionData.currentIndex.value] ,
        bottomNavigationBar:
        BottomNavigationBar(showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize:15 ,backgroundColor: AppStyle.white,elevation: 15,
          selectedLabelStyle: const TextStyle(fontSize: 5),
          selectedItemColor: AppStyle.primaryColor,
          // <-- This works for fixed
          unselectedItemColor: AppStyle.grey,type:BottomNavigationBarType.fixed,
          currentIndex: CachedSessionData.currentIndex.value,
          onTap: (val){
            CachedSessionData.currentIndex.value = val;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: "_",
              icon: Image.asset((CachedSessionData.currentIndex.value==0)?homeBoldImage:homeImage,color: getColor(0,CachedSessionData.currentIndex.value),height: Helper.iconL,),
            ),
            BottomNavigationBarItem(
              label: "_",
              icon: Image.asset((CachedSessionData.currentIndex.value==1)?visitBoldImage:visitImage,color:getColor(1,CachedSessionData.currentIndex.value),height: Helper.iconL,),
            ),
            BottomNavigationBarItem(
              label: "_",
              icon: Image.asset((CachedSessionData.currentIndex.value==2)?searchBoldImage:searchImage,color:getColor(2,CachedSessionData.currentIndex.value),height: Helper.iconL,),
            ),
            BottomNavigationBarItem(
              label: "_",
              icon: Image.asset((CachedSessionData.currentIndex.value==3)?moreBoldImage:moreImage,color:getColor(3,CachedSessionData.currentIndex.value),height: Helper.iconL,),
            ),


          ],
        )


        ,)));


  }
  Color getColor(int index,int current){

    return (index==current) ?AppStyle.primaryColor:AppStyle.grey.withOpacity(.5);
  }
}
