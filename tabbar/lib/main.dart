import 'dart:math';

import 'package:flutter/material.dart';

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
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API\'s for images'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.emoji_objects)),
              Tab(icon: Icon(Icons.feed))
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UrlRandomImageGenerator(
              url: "http://www.fillmurray.com/",
            ),
            UrlRandomImageGenerator(
              url: "https://picsum.photos/",
            ),
            UrlRandomImageGenerator(
              url: "http://placekitten.com/",
            )
          ],
        ),
      ),
    );
  }
}

// class MyImageGenerator extends StatelessWidget {
//   const MyImageGenerator({Key? key, this.url = ""}) : super(key: key);

//   final String url;
//   @override
//   Widget build(BuildContext context) {
//     int randomWidth = randomNumber(max: 250, min: 200);
//     int randomHeight = randomNumber(max: 200, min: 300);

//     return Center(
//         child: Container(
//       margin: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         border: Border.all(width: 8, color: Colors.white),
//         color: Colors.black,
//       ),
//       child: Image.network(
//           url + randomHeight.toString() + "/" + randomWidth.toString()),
//     ));
//   }
// }

class UrlRandomImageGenerator extends StatefulWidget {
  const UrlRandomImageGenerator({Key? key, this.url = ""}) : super(key: key);

  final String url;

  @override
  State<StatefulWidget> createState() => _UrlRandomImageGenerator();
}

class _UrlRandomImageGenerator extends State<UrlRandomImageGenerator> {
  int _randomWidth = 200;
  int _randomHeight = 300;

  @override
  Widget build(BuildContext context) {
    _randomWidth = randomNumber(max: 250, min: 200);
    _randomHeight = randomNumber(max: 300, min: 200);

    return Center(
        child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 8, color: Colors.white),
              color: Colors.black,
            ),
            child: GestureDetector(
              onHorizontalDragStart: (dragParameters) {
                setState(() {
                  _randomWidth = randomNumber(max: 250, min: 200);
                  _randomHeight = randomNumber(max: 300, min: 200);
                });
              },
              child: Image.network(widget.url +
                  _randomHeight.toString() +
                  "/" +
                  _randomWidth.toString()),
            )));
  }
}

/***
 * Helpers
 */
int randomNumber({int max = 400, int min = 0}) {
  Random random = Random();
  return min + random.nextInt(max);
}
