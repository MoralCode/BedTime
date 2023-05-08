import 'package:bedtimes/extensions.dart';
import 'package:bedtimes/timecontroller.dart';
import 'package:flutter/material.dart';

import 'bedtimeinput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeController tc = TimeController();

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [];

    contents.add(BedTimeInput(timeController: tc));

    for (var i = 0; i < 8; i++) {
      TimeOfDay time = tc.time;
      Duration dur = Duration(minutes: 90 * (i + 1));
      time = time.plusMinutes(dur.inMinutes);
      // time.format(context)
      String content =
          "${time.format(context)} (${i + 1} cycles, ${dur.inHours}h";
      int minutesSleep = dur.inMinutes - (dur.inHours * 60);
      if (minutesSleep != 0) {
        content += " ${minutesSleep}m";
      }
      content += " sleep)";
      contents.add(Text(content));
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: contents,
        ),
      ),
    );
  }
}
