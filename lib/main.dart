import 'package:flutter/material.dart';
import 'package:lionsbot_test/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(title: "Login"),
        '/profile': (context) => LoginPage(title: 'Profile'),
        '/remote': (context) => LoginPage(title: 'Remote Control'),
      },
      initialRoute: '/',
    );
  }
}
