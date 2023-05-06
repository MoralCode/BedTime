import 'package:bedtimes/timecontroller.dart';
import 'package:flutter/material.dart';

class BedTimeInput extends StatefulWidget {
  const BedTimeInput({super.key});

  @override
  State<BedTimeInput> createState() => _BedTimeInputState();
}

class _BedTimeInputState extends State<BedTimeInput> {
  TimeOfDay time = TimeOfDay.now();

  void adjustTime({int? hours, int? minutes}) {
    int newMinutes = time.minute + (minutes ?? 0);
    int newHours = time.hour + (hours ?? 0);
    if (newMinutes >= 60) {
      newMinutes = newMinutes % 60;
      newHours += 1;
    }
    setState(() {
      time = time.replacing(hour: newHours, minute: newMinutes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(time.format(context)),
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
