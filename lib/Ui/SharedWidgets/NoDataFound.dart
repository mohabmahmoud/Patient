import 'package:flutter/material.dart';
import 'package:patient/Style/AppStyle.dart';
import 'AppText.dart';

Widget noDataFound(String msg) {
  return Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        Icons.insert_drive_file_outlined,
        color: Colors.grey.shade300,
        size: 120,
      ),
      appText(
          text: msg,
          style: AppStyle.h2PrimarySemiBold.copyWith(
              color: Colors.grey.shade300))
    ]),
  );
}
