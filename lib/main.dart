import 'package:flutter/material.dart';
import 'package:donut_app/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adoption App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginPage(), // inicia en el login
    );
  }
}
