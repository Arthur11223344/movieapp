import 'package:ejemplos02/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Movie",
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme: GoogleFonts.manropeTextTheme(),

      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



