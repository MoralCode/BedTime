import 'package:bedtimes/extensions.dart';
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
    TimeOfDay newTime =
        widget.timeController.time.adjustTime(hours: hours, minutes: minutes);

    setState(() {
      widget.timeController.setTime(newTime);
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
