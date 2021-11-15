import 'package:flutter/material.dart';
import 'package:uocmail/model/email.dart';
import 'helpers/date_helper.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key, required this.email}) : super(key: key);

  final Email email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From: ${email.from}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Divider(
              thickness: 2,
              height: 40,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              email.subject,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              formatDate(email.dateTime),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.grey.withOpacity(0.5)),
            ),
            Divider(
              thickness: 2,
              height: 40,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              email.body,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
