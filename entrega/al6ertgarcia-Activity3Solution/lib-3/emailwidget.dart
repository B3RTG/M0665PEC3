import 'package:flutter/material.dart';
import 'package:uocmail/model/email.dart';

import 'helpers/date_helper.dart';

// al principio había propuesto este widget como statefull y el se encargaba
// de marcar el mail como leido y actualizarse. Esto me estaba dando problemas
// ya que al eliminar un widget no se actualizaba del todo correctamente la lista
// en algunos casos. Si eliminaba un email no leiod y debajo había uno leido,
// se eliminaba correctamente pero el icono de leido se quedaba marcado incorrectamente
// en el que quedaba en la posición del eliminado.
// finalmente se hace Stateless y es la pantalla principal la que se encarga de guardar el estado de los emails.
class EmailWidgetStateless extends StatelessWidget {
  const EmailWidgetStateless(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe})
      : super(key: key);

  final Email email;
  final Function onTap;
  final Function onSwipe;

  double getReadIconVisibility() {
    return email.read ? 0.0 : 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Opacity(
                    opacity: getReadIconVisibility(),
                    child: Icon(
                      Icons.circle_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 15,
                    )),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 1)),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            formatDate(email.dateTime),
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                          ),
                          Text(
                            email.from,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(email.subject, textAlign: TextAlign.left),
                        ],
                      ))),
            ],
          )),
      onTap: () {
        email.read = true;
        onTap(email, context);
      },
      onHorizontalDragEnd: (parameters) => onSwipe(email),
    );
  }
}

@Deprecated('Use [ConflictException]')
class EmailWidget extends StatefulWidget {
  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe})
      : super(key: key);

  final Email email;
  final Function onTap;
  final Function onSwipe;

  @override
  State<EmailWidget> createState() => _EmailWidget();
}

@Deprecated('Use [ConflictException]')
class _EmailWidget extends State<EmailWidget> {
  late double _iconOpacity;

  @override
  void initState() {
    super.initState();
    _iconOpacity = 0.0;
    setupReadIconVisibility();
  }

  void setupReadIconVisibility() {
    _iconOpacity = widget.email.read ? 0.0 : 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Opacity(
                    opacity: _iconOpacity,
                    child: Icon(
                      Icons.circle_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 15,
                    )),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 1)),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            formatDate(widget.email.dateTime),
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                          ),
                          Text(
                            widget.email.from,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(widget.email.subject, textAlign: TextAlign.left),
                        ],
                      ))),
            ],
          )),
      onTap: () {
        widget.email.read = true;
        widget.onTap(widget.email, context);
        setState(() {
          setupReadIconVisibility();
        });
      },
      onHorizontalDragEnd: (parameters) => widget.onSwipe(widget.email),
    );
  }
}
