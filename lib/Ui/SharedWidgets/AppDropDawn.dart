import 'package:flutter/material.dart';
import '../../Core/Helper/Helper.dart';
import '../../Data/Models/LookUps/dd_model.dart';
import '../../Style/AppStyle.dart';

Container dropDownFilter(
    {required List<DDModel> items,
    required functionOnChange,
    String hint = "",
    bool? disable,
    int? selected}) {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.12), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius)),
      ),
      height: 55,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Helper.outerPadding),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selected?.toString(),
            isDense: true,
            isExpanded: true,
            hint: Text(hint, style: AppStyle.h4GreyLight),
            items: items.map((e) => DropdownMenuItem(
                value: e.id.toString(),
                child: Text(
                  e.name,
                  style: (e.id == selected)
                      ? AppStyle.h4PrimarySemiBold
                      : AppStyle.h4BlackSemiBold,
                ))).toList(),
            onChanged: disable == true
                ? null
                : (newValue) {
              functionOnChange(newValue);
                  },
          ),
        ),
      ));
}
