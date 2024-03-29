import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  ///Adjust the time by the given number minutes, accounting for over/underflow
  // https://stackoverflow.com/a/63324667/ Ported from org.threeten.bp; https://github.com/JakeWharton/ThreeTenABP
  TimeOfDay plusMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int mofd = hour * 60 + minute;
      int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
      if (mofd == newMofd) {
        return this;
      } else {
        int newHour = newMofd ~/ 60;
        int newMinute = newMofd % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }
}
