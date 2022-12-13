import 'package:flutter/material.dart';
import 'package:quizly_app/pages/game_page.dart';
import 'package:quizly_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: "ArchitectsDaughter",
        scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1.9),
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}