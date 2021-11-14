import 'package:flutter/material.dart';
import 'package:uocmail/model/email.dart';
import './emailwidget.dart';
import 'detailwidget.dart';
import 'model/backend.dart';

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
        primarySwatch: Colors.red,
      ),
      home: ListScreenStatefull(),
    );
  }
}

// class ListScreen extends StatelessWidget {
//   const ListScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var emails = Backend().getEmails();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mock mail'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//           padding: const EdgeInsets.all(5),
//           itemCount: emails.length,
//           itemBuilder: (context, index) {
//             return EmailWidget(email: emails[index], onTap: showEmailDetail);
//           }),
//     );
//   }

//   void showEmailDetail(Email email, BuildContext context) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => DetailWidget(
//                   email: email,
//                 )));
//   }
// }

class ListScreenStatefull extends StatefulWidget {
  const ListScreenStatefull({Key? key}) : super(key: key);

  @override
  State<ListScreenStatefull> createState() => _ListScreenStatefull();

  // no tengo claro donde debería ir esta llamada, si aqui o en el estado.
  // dado que no afecta al "modelo" la dejo aqui.
  void showEmailDetail(Email email, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailWidget(
                  email: email,
                )));
  }
}

class _ListScreenStatefull extends State<ListScreenStatefull> {
  late List<Email> emails;

  @override
  void initState() {
    super.initState();
    emails = Backend().getEmails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock mail'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: emails.length,
          itemBuilder: (context, index) {
            return EmailWidget(
              email: emails[index],
              onTap: widget.showEmailDetail,
              onSwipe: deleteItem,
            );
          }),
    );
  }

  void deleteItem(Email email) {
    setState(() {
      emails.remove(email);
    });
  }
}
