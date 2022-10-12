import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient/Data/CachedData/cached_user_data.dart';

import 'HomeCategoryCard.dart';



Widget homeCategoryBuilder() {
  final cards = <Widget>[];
  Widget cardsWidget;

  if (CachedSessionData.specialities.isNotEmpty) {
    for (int i = 0; i < CachedSessionData.specialities.length; i++) {
      cards.add(homeCategoryCard(CachedSessionData.specialities[i],i),);
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