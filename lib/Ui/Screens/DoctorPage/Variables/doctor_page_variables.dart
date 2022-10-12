import 'package:get/get.dart';
import 'day_model.dart';
import 'time_slots_model.dart';

RxList<DayModel> days= <DayModel>[].obs;
RxList<TimeSlot> slots= <TimeSlot>[].obs;
RxString selectedSlot="".obs;
