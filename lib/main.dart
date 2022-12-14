import 'package:flutter/material.dart';
import 'package:quizly_app/pages/game_page.dart';
import 'package:quizly_app/pages/welcome_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: "ArchitectsDaughter",
        scaffoldBackgroundColor: const Color.fromRGBO(165, 241, 233, 0.5),
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
