import 'package:bedtimes/extensions.dart';
import 'package:bedtimes/timecontroller.dart';
import 'package:flutter/material.dart';

class BedTimeInput extends StatefulWidget {
  final TimeController timeController;
  //TODO: figure out how to give this controller a default value

  BedTimeInput({super.key, required this.timeController});

  @override
  State<BedTimeInput> createState() => _BedTimeInputState();
}

class _BedTimeInputState extends State<BedTimeInput> {
  void plusMinutes(int minutes) {
    TimeOfDay newTime = widget.timeController.time.plusMinutes(minutes);

    setState(() {
      widget.timeController.setTime(newTime);
    });
  }

  void resetTime() {
    setState(() {
      widget.timeController.setTime(TimeOfDay.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            widget.timeController.time.format(context),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    plusMinutes(-30);
                  },
                  icon: const Icon(Icons.remove_circle_outline)),
              IconButton(
                  onPressed: () {
                    plusMinutes(-10);
                  },
                  icon: const Icon(Icons.remove)),
              TextButton(
                onPressed: () {
                  resetTime();
                },
                child: const Text("reset"),
              ),
              IconButton(
                  onPressed: () {
                    plusMinutes(10);
                  },
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    plusMinutes(30);
                  },
                  icon: const Icon(Icons.add_circle_outline)),
            ],
          )
        ]));
  }
}
