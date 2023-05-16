import 'package:bedtimes/extensions.dart';
import 'package:bedtimes/timecontroller.dart';
import 'package:flutter/material.dart';

class CycleLabel extends StatelessWidget {
  final TimeOfDay time;
  final int cycleNumber;
  final int cycleDuration;

  const CycleLabel(
      {super.key,
      required this.time,
      required this.cycleNumber,
      this.cycleDuration = 90});

  @override
  Widget build(BuildContext context) {
    Duration dur = Duration(minutes: cycleDuration * cycleNumber);
    // time = time.plusMinutes(dur.inMinutes);
    // time.format(context)
    String content = "$cycleNumber : ${time.format(context)} (${dur.inHours}h";

    int minutesSleep = dur.inMinutes - (dur.inHours * 60);
    if (minutesSleep != 0) {
      content += " ${minutesSleep}m";
    }
    content += " sleep)";

    return Text(content);
  }
}
