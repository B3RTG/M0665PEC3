import 'package:flutter/material.dart';
import 'package:routes/screens/screen_widget.dart';

class ScreenFour extends StatelessWidget {
  static const String id = 'screen_four';

  const ScreenFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      background: Colors.yellow[200],
      index: 4,
      ids: const ["screen_three", "screen_five"],
    );
  }
}
