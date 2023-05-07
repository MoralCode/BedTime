import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bedtimes/extensions.dart';

void main() {
  group("TimeOfDayExtension - adjustTime", () {
    //  minutes, small increments, hour boundary
    //  hours, small increments, day boundary

    // forward over edge of many hours
    // back over edge of many hours
    test("minutes, small increments", () {
      var time = TimeOfDay(hour: 5, minute: 30);
      time = time.adjustTime(minutes: 10);
      expect(time, TimeOfDay(hour: 5, minute: 40));
      time = time.adjustTime(minutes: 10);
      expect(time, TimeOfDay(hour: 5, minute: 50));
      time = time.adjustTime(minutes: -10);
      expect(time, TimeOfDay(hour: 5, minute: 40));
      time = time.adjustTime(minutes: -10);
      expect(time, TimeOfDay(hour: 5, minute: 30));
    });

    test("hours, small increments", () {
      var time = TimeOfDay(hour: 5, minute: 30);
      time = time.adjustTime(hours: 1);
      expect(time, TimeOfDay(hour: 6, minute: 30));
      time = time.adjustTime(hours: 1);
      expect(time, TimeOfDay(hour: 7, minute: 30));
      time = time.adjustTime(hours: -1);
      expect(time, TimeOfDay(hour: 6, minute: 30));
      time = time.adjustTime(hours: -1);
      expect(time, TimeOfDay(hour: 5, minute: 30));
    });

    //  minutes, small increments, hour boundary
    //  hours, small increments, day boundary

    test("minutes, small increments, hour boundary", () {
      var time = TimeOfDay(hour: 5, minute: 52);
      time = time.adjustTime(minutes: 10);
      expect(time, TimeOfDay(hour: 6, minute: 02));
      time = time.adjustTime(minutes: 10);
      expect(time, TimeOfDay(hour: 6, minute: 12));
      time = time.adjustTime(minutes: -10);
      expect(time, TimeOfDay(hour: 6, minute: 02));
      time = time.adjustTime(minutes: -10);
      expect(time, TimeOfDay(hour: 5, minute: 52));
    });

    test("hours, small increments, day boundary", () {
      var time = TimeOfDay(hour: 23, minute: 30);
      time = time.adjustTime(hours: 1);
      expect(time, TimeOfDay(hour: 0, minute: 30));
      time = time.adjustTime(hours: 1);
      expect(time, TimeOfDay(hour: 1, minute: 30));
      time = time.adjustTime(hours: -1);
      expect(time, TimeOfDay(hour: 0, minute: 30));
      time = time.adjustTime(hours: -1);
      expect(time, TimeOfDay(hour: 23, minute: 30));
    });

    // forward over edge of many hours
    // back over edge of many hours
    test("minutes, multi-hour increments", () {
      var time = TimeOfDay(hour: 5, minute: 30);
      time = time.adjustTime(minutes: 60 * 3 + 10);
      expect(time, TimeOfDay(hour: 8, minute: 40));
      time = time.adjustTime(minutes: 60 * 3 + 10);
      expect(time, TimeOfDay(hour: 11, minute: 50));
      time = time.adjustTime(minutes: -60 * 3 - 10);
      expect(time, TimeOfDay(hour: 8, minute: 40));
      time = time.adjustTime(minutes: -60 * 3 - 10);
      expect(time, TimeOfDay(hour: 5, minute: 30));
    });

    test("hours, multi-day increments", () {
      var time = TimeOfDay(hour: 5, minute: 30);
      time = time.adjustTime(hours: 24 * 3);
      expect(time, TimeOfDay(hour: 5, minute: 30));
      time = time.adjustTime(hours: 24 * 3);
      expect(time, TimeOfDay(hour: 5, minute: 30));
      time = time.adjustTime(hours: -24 * 3);
      expect(time, TimeOfDay(hour: 5, minute: 30));
      time = time.adjustTime(hours: -24 * 3);
      expect(time, TimeOfDay(hour: 5, minute: 30));
    });
  });
}
