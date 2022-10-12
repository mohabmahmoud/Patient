// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Constants/paths.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Ui/Screens/Home/Widgets/Doctor/home_doctor_loading.dart';
import 'package:patient/Ui/SharedWidgets/loader.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';
import '../../../Core/Helper/Helper.dart';
import '../../../Style/AppStyle.dart';
import '../Home/Widgets/Doctor/home_doctor_card.dart';
import 'search_screen_controller.dart';
class SearchScreen extends StatefulWidget {
  String title="";
  bool ?showFilter;
   SearchScreen({required this.title,this.showFilter,Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<SearchScreenController>(
        init: SearchScreenController(),
    builder: (ctr) {

    return screenDiraction(child: Scaffold(drawer: const Drawer(),appBar:
    AppBar(
    actions: [
   widget.showFilter==true? InkWell(onTap: (){

    },child:
    Container(margin: EdgeInsets.only(top:Helper.outerPadding/2 ,bottom:Helper.outerPadding/2 ,right: Helper.outerPadding,left:Helper.outerPadding ),width: 50,height: 50,decoration: MainBoxDecorationStyle(AppStyle.shadowColor, 5),child:
    Padding(
    padding: EdgeInsets.only(right: Helper.outerPadding,left:Helper.outerPadding ),
    child: Image.asset("Images/filter.png",color: AppStyle.black.withOpacity(.6),fit: BoxFit.fitWidth,width: 25,height: 25,)),
    )


    ):Container()

    ],
    centerTitle: false,title:  Text( widget.title,style: AppStyle.Title),
    bottom: PreferredSize(
    preferredSize:  Size.fromHeight(Helper.itemsHeight),
    child: Padding(
    padding: EdgeInsets.only(left: Helper.outerPadding,
    bottom:Helper.outerPadding/2 ,right: Helper.outerPadding),
    child:


   SizedBox(
    height: 56,
    child:
    Container(
    decoration: BoxDecoration(
    color: AppStyle.shadowColor,
    borderRadius: BorderRadius.circular(Helper.borderRadius*2),
    ),
    child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: Helper.outerPadding),
    child: TextField(
      onChanged: ctr.onChange,
      onSubmitted:(String ?s){
        ctr.search();
      },
      decoration: InputDecoration(
    border: InputBorder.none,suffixIcon:
      InkWell(child:Container(width:Helper.iconL*2 ,alignment: Alignment.center,child:Image.asset(searchImage, height: Helper.iconL,color: AppStyle.primaryColor,)),onTap: (){
        ctr.search();
      }),
    hintText: appDic["Enter Doctor Name"],
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    hintStyle: AppStyle.h2GreyLight
    ),)

    ))


    )






    )),
      elevation: 1,
      leadingWidth:!Navigator.canPop(context)? 0:Helper.sW/8,
      leading: Navigator.canPop(context)? InkWell(child:const Icon(Icons.arrow_back),onTap: (){
        Navigator.pop(context);

      },):Container(),

    ),body:
    (ctr.isLoading&&ctr.filteredDoctors.isEmpty)?
    SingleChildScrollView(physics: const NeverScrollableScrollPhysics(),child:homeDoctorLoading(isVertical: true)):
      NotificationListener<ScrollNotification>(
      child:
      ListView.builder(
              itemCount: ctr.filteredDoctors.length,itemBuilder: (context, index) {
              return Padding(padding:EdgeInsets.all(Helper.outerPadding/2) ,
                  child:homeDoctorCard( isFullScreen: true,doctor: ctr.filteredDoctors[index]));
            },) ,
      onNotification: (ScrollNotification scrollInfo) {
         ctr.loadMore(scrollInfo);
        return true;
      },

      )
    ,
      bottomNavigationBar: Wrap(children: [
        (ctr.isLoading&&ctr.filteredDoctors.isNotEmpty)? Padding(padding:EdgeInsets.all(Helper.outerPadding),child:const Loader()):Container()
      ]),

    ));
    });
  }
}
