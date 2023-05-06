import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {

  ///Adjust the time by the given number of hours and minutes, accounting for over/underflow
  //TODO: tests
  // forward
  // back
  // forward over edge of one hour
  // back over edge of one hour
  // forward over edge of many hours
  // back over edge of many hours
  TimeOfDay adjustTime({int? hours, int? minutes}) {
    int newMinutes = minute + (minutes ?? 0);
    int newHours = hour + (hours ?? 0);
    if (newMinutes >= 60) {
      newMinutes = newMinutes % 60;
      newHours += 1;
    } else if (newMinutes < 0) {
      newHours -= 1;
      newMinutes +=
          60; //TODO, handle more than one whole hours worth of going back
    }

    return replacing(hour: newHours, minute: newMinutes);
  }
}
