import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bedtimes/extensions.dart';

void main() {
  group("TimeOfDayExtension - plusMinutes", () {
    test("minutes, small increments", () {
      var time = TimeOfDay(hour: 5, minute: 30);
      time = time.plusMinutes(10);
      expect(time, TimeOfDay(hour: 5, minute: 40));
      time = time.plusMinutes(10);
      expect(time, TimeOfDay(hour: 5, minute: 50));
      time = time.plusMinutes(-10);
      expect(time, TimeOfDay(hour: 5, minute: 40));
      time = time.plusMinutes(-10);
      expect(time, TimeOfDay(hour: 5, minute: 30));
    });
    test("minutes, small increments, hour boundary", () {
      var time = TimeOfDay(hour: 5, minute: 52);
      time = time.plusMinutes(10);
      expect(time, TimeOfDay(hour: 6, minute: 02));
      time = time.plusMinutes(10);
      expect(time, TimeOfDay(hour: 6, minute: 12));
      time = time.plusMinutes(-10);
      expect(time, TimeOfDay(hour: 6, minute: 02));
      time = time.plusMinutes(-10);
      expect(time, TimeOfDay(hour: 5, minute: 52));
    });

    test("minutes, multi-hour increments", () {
      var time = TimeOfDay(hour: 5, minute: 30);
      time = time.plusMinutes(60 * 3 + 10);
      expect(time, TimeOfDay(hour: 8, minute: 40));
      time = time.plusMinutes(60 * 3 + 10);
      expect(time, TimeOfDay(hour: 11, minute: 50));
      time = time.plusMinutes(-60 * 3 - 10);
      expect(time, TimeOfDay(hour: 8, minute: 40));
      time = time.plusMinutes(-60 * 3 - 10);
      expect(time, TimeOfDay(hour: 5, minute: 30));
    });
  });
}
