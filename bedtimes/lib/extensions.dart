import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  ///Adjust the time by the given number of hours and minutes, accounting for over/underflow
  TimeOfDay adjustTime({int hours = 0, int minutes = 0}) {
    print("---");
    print("current time is $hour:$minute");

    print("adjustment requested is $hours:$minutes");

    const MINUTES_PER_HOUR = 60;

    //subtract the current number of minutes from MINUTES_PER_HOUR to account for potential overflow when re-adding this back to minutes as well
    // int timecap = MINUTES_PER_HOUR;

    bool shouldSubtract = minutes < 0 || hours < 0;

    if (shouldSubtract) {
      hours = hours.abs();
      minutes = minutes.abs();
    }

    // int h = minutes ~/ MINUTES_PER_HOUR;
    // print(h);
    // print(minutes % -60);

    if (minutes >= MINUTES_PER_HOUR) {
      hours += minutes ~/ MINUTES_PER_HOUR;
      minutes = minutes % MINUTES_PER_HOUR;
    }

    // if
    print("corrected adjustment is $hours:$minutes");

    if (minutes < 0) {
      int borrowed_hrs = (minutes ~/ MINUTES_PER_HOUR) + 1;
      print("borrowed $borrowed_hrs");
      hours -= borrowed_hrs;
      print("$hours:$minutes");

      minutes += (borrowed_hrs * MINUTES_PER_HOUR);
      print("$hours:$minutes");
    }
    print("normalized adjustment is $hours:$minutes");

    hours += hour;
    minutes += minute;

    //run the process again after applying it in case the application also caused it to overflow
    if (minutes >= MINUTES_PER_HOUR) {
      hours += minutes ~/ MINUTES_PER_HOUR;
      minutes = minutes % MINUTES_PER_HOUR;
    } else if (minutes < 0) {}

    print("applied adjustment is $hours:$minutes");

    return replacing(hour: hours, minute: minutes);
  }
  }
}
