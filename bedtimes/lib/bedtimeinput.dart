import 'package:bedtimes/timecontroller.dart';
import 'package:flutter/material.dart';

class BedTimeInput extends StatefulWidget {
  final TimeController timeController;

  BedTimeInput({super.key, required this.timeController});

  @override
  State<BedTimeInput> createState() => _BedTimeInputState();
}

class _BedTimeInputState extends State<BedTimeInput> {
  void adjustTime({int? hours, int? minutes}) {
    int newMinutes = widget.timeController.time.minute + (minutes ?? 0);
    int newHours = widget.timeController.time.hour + (hours ?? 0);
    if (newMinutes >= 60) {
      newMinutes = newMinutes % 60;
      newHours += 1;
    } else if (newMinutes < 0) {
      newHours -= 1;
      newMinutes += 60;
    }
    setState(() {
      widget.timeController.replaceTime(hours: newHours, minutes: newMinutes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(widget.timeController.time.format(context)),
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
