
import 'package:flutter/material.dart';

Text appText(
    {required String ?text, required TextStyle style, TextAlign? textAlign,int ?maxLines}) {
  return Text(
    text??"",
    style: style,
    textAlign: textAlign,
    maxLines: maxLines??1,
    overflow: TextOverflow.ellipsis,
  );
}
