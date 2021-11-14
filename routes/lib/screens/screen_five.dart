import 'package:flutter/material.dart';
import 'package:routes/screens/screen_widget.dart';

class ScreenFive extends StatelessWidget {
  static const String id = 'screen_five';

  const ScreenFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      background: Colors.deepOrange[200],
      index: 4,
      ids: const ["screen_one", "screen_two", "screen_four"],
      showCloseAllButton: true,
    );
  }
}
