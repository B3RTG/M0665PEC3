import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen(
      {Key? key,
      required this.index,
      required this.ids,
      required this.background,
      this.showCloseAllButton = false})
      : super(key: key);

  final int index;
  final Color? background;
  final List<String> ids;
  final bool showCloseAllButton;

  List<Widget> createItems(BuildContext context) {
    List<Widget> itemList = [
      Text(
        'This is screen number ${index.toString()}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
      )
    ];

    for (String current in ids) {
      itemList.add(TextButton(
        onPressed: () {
          Navigator.pushNamed(context, current);
        },
        child: Text('Go to screen ${current.toString()}'),
      ));
    }

    if (showCloseAllButton) {
      itemList.add(TextButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: const Text('Go to first screen'),
      ));
    }

    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(index.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createItems(context)),
      ),
    );
  }
}
