
import 'package:flutter/material.dart';
import 'package:patient/Core/Helper/Helper.dart';

import '../../Style/AppStyle.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String ?text;
  final Widget? image;
  final VoidCallback ?onPressed;
  final TextStyle ?textStyle;
  final double ?height;

   const AppButton({Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.onPressed,
    this.image,
     this.textStyle,
     this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Material(
          borderRadius: BorderRadius.circular(Helper.borderRadius),
          elevation: 2,child:
      Container(height: height??Helper.itemsHeight,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      child:TextButton(
              style: TextButton.styleFrom(
                backgroundColor: onPressed==null?AppStyle.grey:color,
                padding:  EdgeInsets.all(Helper.spaceM),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Helper.borderRadius),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text??"",
                style: textStyle??AppStyle.h2WhiteSemiBold,
              ),
            ),
    ));
  }
}
