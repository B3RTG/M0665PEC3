import 'package:flutter/material.dart';
import 'package:routes/screens/screen_widget.dart';

class ScreenOne extends StatelessWidget {
  static const String id = 'screen_one';

  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      background: Colors.green[200],
      index: 1,
      ids: const ["screen_three", "screen_four"],
    );
  }
}
