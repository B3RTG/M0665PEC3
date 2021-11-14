import 'package:flutter/material.dart';
import 'package:routes/screens/screen_widget.dart';

class ScreenThree extends StatelessWidget {
  static const String id = 'screen_three';

  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      background: Colors.red[200],
      index: 3,
      ids: const ["screen_one", "screen_two"],
    );
  }
}
