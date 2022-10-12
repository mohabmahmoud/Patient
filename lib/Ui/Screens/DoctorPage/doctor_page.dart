import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Constants/constants.dart';
import 'package:patient/Core/Helper/Helper.dart';
import 'package:patient/Core/Language/LangVariables.dart';
import 'package:patient/Style/AppStyle.dart';
import 'package:patient/Ui/Screens/DoctorPage/Widgets/doctor_Appointments.dart';
import 'package:patient/Ui/Screens/DoctorPage/doctor_page_controller.dart';
import 'package:patient/Ui/SharedWidgets/AppButton.dart';
import 'package:patient/Ui/SharedWidgets/AppNumber.dart';
import 'package:patient/Ui/SharedWidgets/AppText.dart';
import 'package:patient/Ui/SharedWidgets/SizedBoxes.dart';
import 'package:patient/Ui/SharedWidgets/screenDiraction.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorPageController>(
        init: DoctorPageController(),
        builder: (ctr) {
          return screenDiraction(
              child: Scaffold(
                  bottomNavigationBar: Container(
                      padding: EdgeInsets.all(Helper.outerPadding),
                      child: AppButton(
                          textColor: AppStyle.white,
                          onPressed: () async{
                            await ctr.showDoctorDateAndSlots();
                          },
                          text: appDic["Appointment Now"],
                          color: AppStyle.accentColors)),
                  body: SizedBox(
                      width: Helper.sW,
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      bottom: Helper.outerPadding * 2,
                                      right: Helper.outerPadding / 2,
                                      left: Helper.outerPadding / 2),
                                  width: Helper.sW,
                                  height: Helper.sH / 2.5,
                                  child: Stack(
                                    children: [
                                      SizedBox(width: Helper.sW,child:
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Helper.borderRadius * 3),
                                          child:
                                          ctr.doctor.image==null||ctr.doctor.image!.isEmpty?
                                              Image.asset((ctr.doctor.sexId==1)?"Images/DoctorScreen/M_doctor.png":"Images/DoctorScreen/F_doctor.png",fit: BoxFit.fitHeight,):
                                          Image.network(
                                              "ctr.doctor.image",
                                              width: Helper.sW,
                                              fit: BoxFit.cover)


                                      )),
                                      Positioned(
                                          top: 10,
                                          child:
                                              InkWell(child:
                                              Container(
                                                  decoration:
                                                      MainOutLineBoxDecorationStyle(
                                                          AppStyle.black,
                                                          3,
                                                          AppStyle.grey
                                                              .withOpacity(.7)),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Helper.outerPadding,
                                                      vertical:
                                                          Helper.outerPadding),
                                                  padding: EdgeInsets.all(
                                                      Helper.outerPadding *
                                                          1.5),
                                                  child: const Icon(
                                                    Icons.arrow_back,
                                                    color: AppStyle.black,
                                                  )),
                                              onTap: (){
                                                Get.back();

                                              },
                                              )
                                          ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Helper.outerPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: Helper.innerPadding,
                                                  horizontal:
                                                      Helper.outerPadding * 2),
                                              decoration:
                                                  MainOutLineBoxDecorationStyle(
                                                (ctr.doctor.isGreen == true)
                                                    ? AppStyle.green
                                                        .withOpacity(.9)
                                                    : AppStyle.red
                                                        .withOpacity(.9),
                                                2,
                                                (ctr.doctor.isGreen == true)
                                                    ? AppStyle.green
                                                        .withOpacity(.3)
                                                    : AppStyle.red
                                                        .withOpacity(.3),
                                              ),
                                              child: appText(
                                                  text: ctr
                                                      .doctor.availabilityLabel,
                                                  style: (ctr.doctor.isGreen ==
                                                          true)
                                                      ? AppStyle.h4GreenLight
                                                      : AppStyle.h4RedLight)),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.star_rounded,
                                                color: AppStyle.amber,
                                                size: 24,
                                              ),
                                              appText(
                                                  text: "(${ctr.doctor.rate})",
                                                  style:
                                                      AppStyle.h3AmberSemiBold)
                                            ],
                                          )
                                        ],
                                      ),
                                      sizedS(),
                                      appText(
                                          text: ctr.doctor.name,
                                          maxLines: 2,
                                          style: AppStyle.h1BlackBold),
                                      sizedS(),
                                      appText(
                                          text: ctr.doctor.speciality,
                                          maxLines: 1,
                                          style: AppStyle.h2PrimarySemiBold),
                                      sizedM(),
                                    ],
                                  ))
                            ],
                          ),
                          const Divider(),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Helper.outerPadding),
                              child:  appText(
                                  text: appDic["Clinics"],
                                  style: AppStyle.h1PrimaryBold
                                      .copyWith(height: 1.5))),
                          Wrap(children:  ctr.clinics.map((i) =>

                              InkWell(child:
                              Container(
                                  color: AppStyle.shadowColor,
                                  padding: EdgeInsets.symmetric(
                                      vertical: Helper.outerPadding * 2),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.topCenter,
                                            width: 30,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: i.id==ctr.selectClinicId?AppStyle.accentColors:Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        Helper.borderRadius * 2),
                                                    bottomLeft: Radius.circular(
                                                        Helper.borderRadius * 2))),
                                          ),
                                          sizedWS(),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              appText(
                                                  text: appDic["Clinic"],
                                                  style: AppStyle.h3BlackSemiBold),
                                              sizedS(),
                                              appText(
                                                  text:i.name,
                                                  style: AppStyle.h2BlackSemiBold),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  )),
                              onTap: (){

ctr.updateClinicId(i.id);

                              },

                              )

                          ).toList(),)
                          ,
                          const Divider(),
                          ListTile(
                            title: appText(
                                text: appDic["About Doctor"],
                                style: AppStyle.h2PrimaryBold
                                    .copyWith(height: 1.5)),
                            subtitle: appText(
                                text:
                                    "الطبيب كما يُعرف بالاسم الأقل شيوعاً الآسي هو من درس علم الطب ومارسها. وهو يعاين المرضى ويشخص لهم المرض ويصرف لهم وصفة يكتب فيها الدواء. والطبيب بعد تخرجه يمارس الطب العام. وإذا استمر في دراسته يتخصص في مجال معين في الطب.",
                                maxLines: 20,
                                style: AppStyle.h3GreyLight),
                          ),
                          const Divider(),
                        ],
                      ))));
        });
  }
}
