import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nasha Mukt Bharat"),
        centerTitle: true,
        backgroundColor: Colors.purple[600],
      ),
      body: Container(
          child: const Center(
        child: Text("HomePage"),
      )),
    );
  }
}
