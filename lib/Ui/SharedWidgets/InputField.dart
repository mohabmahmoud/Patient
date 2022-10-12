import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Core/Helper/Helper.dart';
import '../../Style/AppStyle.dart';

class AppInputField extends StatelessWidget {
  final String label;
  final String ?value;
  final IconData? prefixIcon;
  final bool obscureText;
  final Function(String)? onchange;
  final Widget? preFexWidget;
  final bool? isNumber;
  final bool? isMultiLine;
  final bool? disable;
  final TextStyle? textStyle;
  final TextAlign? alignment;
  TextEditingController? controller;

  AppInputField(
      {Key? key, required this.label,
        this.prefixIcon,
        this.obscureText = false,
        this.onchange,
        this.preFexWidget,
        this.isMultiLine,
        this.isNumber,
        this.value,
        this.controller,
        this.textStyle,
        this.alignment,
        this.disable



      }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    if(value!=null){
    controller ??= TextEditingController();
    controller!.text=value!;

    }
    return
Material(
borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius))

    ,elevation: 1,child:
    SizedBox(height: Helper.itemsHeight,child:
    TextField(
      onChanged: onchange,
      controller:controller ,
      minLines: isMultiLine==true?3:1,
      maxLines: isMultiLine==true?3:1,
      textAlign: alignment??TextAlign.start,
      style: textStyle??AppStyle.h2BlackSemiBold,
      enabled: !(disable==true),
      autocorrect: true,
      keyboardType:
      isNumber ==true ? TextInputType.number : TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        isNumber ==true
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: AppStyle.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 23.0),
        isCollapsed: true,


        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
          borderSide: BorderSide(color: AppStyle.primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
      borderSide: BorderSide(color: AppStyle.primaryColor.withOpacity(0.15)),
    ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
          borderSide: BorderSide(color: AppStyle.primaryColor.withOpacity(0.15)),
        ),

        hintText: label,
        hintStyle: AppStyle.h2GreyLight,
        // ignore: prefer_if_null_operators
        prefixIcon: preFexWidget != null
            ? preFexWidget
            : prefixIcon != null
            ? Icon(
          prefixIcon,
          color: AppStyle.grey,
        )
            : null,
      ),
      obscureText: obscureText,
    )));
  }
}
