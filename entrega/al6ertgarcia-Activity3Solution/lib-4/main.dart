import 'package:flutter/material.dart';
import 'package:routes/screens/screen_five.dart';
import 'package:routes/screens/screen_four.dart';
import 'package:routes/screens/screen_one.dart';
import 'package:routes/screens/screen_three.dart';
import 'package:routes/screens/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RoutesApp(),
    );
  }
}

class RoutesApp extends StatelessWidget {
  const RoutesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ScreenOne.id,
      routes: {
        ScreenOne.id: (context) => const ScreenOne(),
        ScreenTwo.id: (context) => const ScreenTwo(),
        ScreenThree.id: (context) => const ScreenThree(),
        ScreenFour.id: (context) => const ScreenFour(),
        ScreenFive.id: (context) => const ScreenFive(),
      },
    );
  }
}
