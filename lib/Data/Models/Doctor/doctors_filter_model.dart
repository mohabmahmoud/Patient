class DoctorsFilter{
  String ?doctorName="" ;
 int ?pageIndex=0;
 int ?pageSize=10 ;
 bool? bestRating =false;
 bool? iSAvailableNow=false ;
 int ? specialityId ;
  DoctorsFilter();

  Map<String, dynamic> toJson() {

    return {
      "Name": doctorName,
      'PageIndex': pageIndex,
      "PageSize":pageSize,
      "BestRating":bestRating,
      "ISAvailableNow":iSAvailableNow,
      "SpecialityId":specialityId,
    };



  }


  }