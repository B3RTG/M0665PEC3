import 'package:flutter/material.dart';
import 'package:routes/screens/screen_widget.dart';

class ScreenTwo extends StatelessWidget {
  static const String id = 'screen_two';

  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      background: Colors.blue[200],
      index: 1,
      ids: const ["screen_five"],
    );
  }
}
