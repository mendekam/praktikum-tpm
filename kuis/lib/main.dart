import 'package:flutter/material.dart';
import 'package:kuis/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicaon.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis',
      theme: ThemeData(
          
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

