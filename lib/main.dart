import 'package:flutter/material.dart';
import 'package:lionsbot_test/pages/login.dart';
import 'package:lionsbot_test/pages/profile.dart';
import 'package:lionsbot_test/pages/remote_control.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(title: "Login"),
        '/profile': (context) => ProfilePage(title: 'Profile'),
        '/remote': (context) => RemotePage(title: 'Remote Control'),
      },
      initialRoute: '/',
    );
  }
}
