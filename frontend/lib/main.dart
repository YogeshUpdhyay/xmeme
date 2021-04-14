import 'package:flutter/material.dart';
import 'package:xmeme/views/addmeme.dart';
import 'package:xmeme/views/memedisplay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xmeme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MemeDisplay(),
        "/addmeme": (context) => AddMeme(),
      },
    );
  }
}
