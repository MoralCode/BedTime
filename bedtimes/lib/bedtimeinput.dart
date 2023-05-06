import 'package:bedtimes/timecontroller.dart';
import 'package:flutter/material.dart';

class BedTimeInput extends StatefulWidget {
  const BedTimeInput({super.key});

  @override
  State<BedTimeInput> createState() => _BedTimeInputState();
}

class _BedTimeInputState extends State<BedTimeInput> {
  TimeController timeController = TimeController();

  void adjustTime({int? hours, int? minutes}) {
    int newMinutes = timeController.time.minute + (minutes ?? 0);
    int newHours = timeController.time.hour + (hours ?? 0);
    if (newMinutes >= 60) {
      newMinutes = newMinutes % 60;
      newHours += 1;
    }
    setState(() {
      timeController.replaceTime(hours: newHours, minutes: newMinutes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(timeController.time.format(context)),
          //button bar for incrementing and decrementing time
          TextButton(
            onPressed: () {
              adjustTime(minutes: 10);
            },
            child: const Text("add 10 min"),
          ),
          TextButton(
            onPressed: () {
              adjustTime(minutes: -10);
            },
            child: const Text("remove 10 min"),
          ),
          //sleep cycle results
        ]));
  }
}
