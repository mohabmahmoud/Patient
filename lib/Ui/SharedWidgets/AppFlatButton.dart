// ignore_for_file: avoid_types_as_parameter_names, file_names

import 'package:flutter/material.dart';

import 'AppText.dart';

// ignore: non_constant_identifier_names
AppFlatButton({required TextStyle style, required String text, Function}) {
  return InkWell(
    onTap: Function,
    child: appText(
      text: text,
      style: style,
    ),
  );
}
