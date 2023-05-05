import 'package:flutter/material.dart';

class BedTimeInput extends StatefulWidget {
  const BedTimeInput({super.key});

  @override
  State<BedTimeInput> createState() => _BedTimeInputState();
}

class _BedTimeInputState extends State<BedTimeInput> {
  TimeOfDay time = TimeOfDay.now();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(time.format(context)),
          //button bar for incrementing and decrementing time
          TextButton(
            onPressed: () {
              setState(() {
                setState(() {
                  time = time.replacing(minute: time.minute + 10);
                });
              });
              //  + Duration(minutes: 10);
            },
            child: Text("add 10 min"),
          )
          //sleep cycle results
        ]));
  }
}
