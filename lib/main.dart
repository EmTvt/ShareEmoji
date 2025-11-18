import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF07C160),
        scaffoldBackgroundColor: const Color(0xFFEDEDED),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEDEDED),
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const Text("123"),
    );
  }
}