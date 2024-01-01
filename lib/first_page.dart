import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(189, 196, 236, 198),
      child: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
