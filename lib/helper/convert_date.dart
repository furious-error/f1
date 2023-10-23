import 'package:intl/intl.dart';

String? convertDateFormat(String? inputDate) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final outputFormat = DateFormat('dd MMM', 'en_US');

  final date = inputFormat.parse(inputDate!);
  return outputFormat.format(date);
}

String? convertDateFormat1(String? inputDate) {
  // final inputFormat = DateFormat('yyyy-MM-dd');
  final outputFormat = DateFormat('dd MMM', 'en_US');

  DateTime? date = DateFormat('yyyy-MM-dd, HH:mm:ssZ').parse(inputDate!, true).toLocal();
  // print(date);
  return outputFormat.format(date);
}

String? convertTimeFormat(String? inputTime){
  // final inputFormat = DateFormat.Hms();
  final outputFormat = DateFormat.jm();
  
  DateTime? time = DateFormat('HH:mm').parse(inputTime!, true).toLocal();
  return outputFormat.format(time);
  // return time.toString().substring(11,16);
  // return time.toString(); 
}