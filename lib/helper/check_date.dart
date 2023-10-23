// import 'package:flutter/material.dart';

// class CheckDatetime extends StatelessWidget {
//   final String eventEndTime;
//   Widget A;
//   Widget B;
//   CheckDatetime({super.key, required this.eventEndTime, required this.A, required this.B});

//   @override
//   Widget build(BuildContext context) {
//     var time = DateTime.parse(eventEndTime);
//     var nowTime = DateTime.now();
//     return time.isBefore(nowTime)?A:B;
//   }
// }

bool checkDatetime(String eventEndTime){
  var time = DateTime.parse(eventEndTime);
  var nowTime = DateTime.now();
  return time.isBefore(nowTime);
}
// bool checkDatetimeAfter(String eventEndTime){
//   var time = DateTime.parse(eventEndTime);
//   var nowTime = DateTime.now();
//   return time.isAfter(nowTime);
// }

// bool checkDatetimeAfter(String eventPrevEndTime, String otherTime){
//   var time = DateTime.parse(eventPrevEndTime);
//   var time2 = DateTime.parse(otherTime);
//   return time.isAfter(time2);
// }


// bool isTimeBetween(String prevEvent, String currEvent) {
//   var start = DateTime.parse(startTime);
//   var end = DateTime.parse(endTime);
//   // var mid = DateTime.parse(checkTime);
//   var mid = DateTime.now();
//   return mid.isAfter(start) && mid.isBefore(end);
// }

// bool checkTimeBetween(DateTime startTime, DateTime endTime, DateTime checkTime) {
//   final currentTime = DateTime.now();
//   final startTime = DateTime(currentTime.year, currentTime.month, currentTime.day, 8, 0); // Replace with your start time
//   final endTime = DateTime(currentTime.year, currentTime.month, currentTime.day, 17, 0); // Replace with your end time
//   final checkTime = DateTime(currentTime.year, currentTime.month, currentTime.day, 12, 30); // Replace with the time you want to check

//   if (isTimeBetween(startTime, endTime, checkTime)) {
//     // print('The check time is between the start and end times.');
//     return true;
//   } else {
//     // print('The check time is NOT between the start and end times.');
//     return false;
//   }
// }
