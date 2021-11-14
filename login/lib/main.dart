import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'LOGIN'),
    );
  }
}

class SuccessLoginPage extends StatelessWidget {
  const SuccessLoginPage({Key? key, this.userName = "", this.password = ""})
      : super(key: key);

  final String userName;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onHorizontalDragEnd: (dragParameters) => {Navigator.pop(context)},
          child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "User name passed is:",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      userName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Password passed is:",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      password,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Go back",
                          textAlign: TextAlign.center,
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            primary: Colors.white),
                      ),
                    ),
                  ]))),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controllerUserName;
  late TextEditingController _controllerPassword;
  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _username = "";
    _password = "";
    _controllerUserName = TextEditingController(text: _username);
    _controllerPassword = TextEditingController(text: _password);
  }

  @override
  void dispose() {
    _controllerUserName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Colors.grey),
              ),
              hintText: 'Enter you username',
            ),
            controller: _controllerUserName,
          ),
          const SizedBox(height: 10.0),
          TextField(
            textAlign: TextAlign.center,
            obscureText: true,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3.0, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.grey),
                ),
                hintText: 'Enter you password'),
            controller: _controllerPassword,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SuccessLoginPage(
                            userName: _controllerUserName.text,
                            password: _controllerPassword.text)))
              },
              child: const Text(
                "LOGIN",
                textAlign: TextAlign.center,
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent, primary: Colors.white),
            ),
          ),
        ],
      ),
    ));
  }
}
