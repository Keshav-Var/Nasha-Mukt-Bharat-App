import 'package:flutter/material.dart';
import 'package:mini_project/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nasha Mukt Bharat"),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      drawer: const MyDrawer(),
      body: Container(
          child: const Center(
        child: Text("HomePage"),
      )),
    );
  }
}
