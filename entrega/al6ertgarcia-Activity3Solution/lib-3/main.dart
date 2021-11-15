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

// al principio había propuesto este widget como stateless y el widget "emailwidget" se encargaba
// de marcar el mail como leido y actualizarse. Esto me estaba dando problemas
// ya que al eliminar un widget no se actualizaba del todo correctamente la lista
// en algunos casos. Si eliminaba un email no leiodo y debajo había uno leido,
// se eliminaba correctamente pero el icono de leido se quedaba marcado incorrectamente
// en el que quedaba en la posición del eliminado.
// finalmente se hace Statefull y es la este el que se encarga de guardar el estado de los emails
// y hacer el setstate tanto en el update de un mail como leido como en la eliminación
class ListScreenStatefull extends StatefulWidget {
  const ListScreenStatefull({Key? key}) : super(key: key);

  @override
  State<ListScreenStatefull> createState() => _ListScreenStatefull();
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
          //key: Key(emails.length.toString()),
          padding: const EdgeInsets.all(5),
          itemCount: emails.length,
          itemBuilder: (context, index) {
            return EmailWidgetStateless(
              email: emails[index],
              onTap: showEmailDetail,
              onSwipe: deleteItem,
            );
          }),
    );
  }

  void showEmailDetail(Email email, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailWidget(
                  email: email,
                )));
    setState(() {
      email.read = true;
    });
  }

  void deleteItem(Email email) {
    setState(() {
      emails.remove(email);
    });
  }
}
