import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(189, 196, 236, 198),
      child: const Center(
        child: Text("Blogs"),
      ),
    );
  }
}
