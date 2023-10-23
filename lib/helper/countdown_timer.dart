import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CountDowntimer extends StatefulWidget {
  final String? time;
  const CountDowntimer({super.key, required this.time});

  @override
  State<CountDowntimer> createState() => _CountDowntimerState();
}

class _CountDowntimerState extends State<CountDowntimer> {
  @override
  Widget build(BuildContext context) {
    var weekendStarttime = DateTime.parse(widget.time!);
    return TimerCountdown(
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      endTime: weekendStarttime,
      // onEnd: () {
      //   Text('Race weekend has started');
      // },
      colonsTextStyle: const TextStyle(
        fontFamily: 'Formula1',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      timeTextStyle: const TextStyle(
        fontFamily: 'Formula1',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      descriptionTextStyle: const TextStyle(
        fontFamily: 'Formula1',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(225, 6, 0, 1),
      ),
    );
  }
}
