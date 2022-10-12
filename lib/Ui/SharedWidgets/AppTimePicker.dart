import 'package:flutter/material.dart';
import '../../Core/Helper/Helper.dart';
import 'AppText.dart';
import '../../Style/AppStyle.dart';


InkWell appTimePicker({onChange,TimeOfDay ?timeOfDay}){
  return InkWell(child:Container(height: 50,

      decoration:
      BoxDecoration(border:Border.all(color: Colors.black.withOpacity(0.12), width: 1.2),borderRadius: BorderRadius.all(Radius.circular(Helper.borderRadius))



  ),



      child:Row(children: [
    Padding(padding:EdgeInsets.symmetric(horizontal: Helper.outerPadding),child: const Icon(Icons.access_time_outlined,color: AppStyle.grey,)),
    appText(text: timeOfDay!=null?timeOfDay.format(Helper.materialKey.currentContext!):"--:--:--",style: timeOfDay!=null?AppStyle.h3GreySemiBold:AppStyle.h5PrimarySemiBold)


  ],)),
    onTap: ()async {
    TimeOfDay?  newTime = await showTimePicker(
        context: Helper.materialKey.currentContext!,
        // ignore: unnecessary_null_comparison
        initialTime: timeOfDay ?? const TimeOfDay(hour: 0, minute: 0)
    );

    if(newTime!=null){
      onChange(newTime);
    }

  },


  );


}