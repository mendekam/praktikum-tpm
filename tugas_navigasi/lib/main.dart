import 'package:flutter/material.dart';
import 'package:tugas_navigasi/pages/splashscreen.dart';

import 'pages/detailpage.dart';
import 'pages/homepage.dart';
import 'pages/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: const SplashScreen(),
    );
  }
}

