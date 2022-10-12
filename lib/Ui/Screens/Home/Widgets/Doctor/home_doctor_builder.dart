import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient/Data/Models/Doctor/doctor_model.dart';

import 'home_doctor_card.dart';



Widget homeDoctorsBuilder(List<DoctorModel> doctors) {
  final cards = <Widget>[];
  Widget cardsWidget;

  if (doctors.isNotEmpty) {
    for (int i = 0; i < doctors.length; i++) {
      cards.add(homeDoctorCard(doctor:doctors[i] ),);
    }
    cardsWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Row(children: cards),
        ),
      ],
    );
  } else {
    cardsWidget = Container();
  }
  return cardsWidget;
}