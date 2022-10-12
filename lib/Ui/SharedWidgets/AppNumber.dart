// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../Core/Language/LangVariables.dart';
import 'AppText.dart';

Text appNumber({required String ?text, required TextStyle style}) {
  return appText(
     text:text??"",
     style: (langShortName=='ar')?style.copyWith(fontFamily: "Numbers"):style,
    maxLines: 1
  );
}
