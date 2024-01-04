import 'package:flutter/material.dart';
import 'package:mini_project/homepage/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nasha Mukt Bharat",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 160, 214, 97),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
