import 'package:flutter/material.dart';

class TimeController extends ChangeNotifier {
  TimeOfDay time = TimeOfDay.now();

  void setTime(TimeOfDay time) {
    time = time;
    notifyListeners();
  }

  void replaceTime({int? hours, int? minutes}) {
    time = time.replacing(hour: hours, minute: minutes);
    notifyListeners();
  }
}
