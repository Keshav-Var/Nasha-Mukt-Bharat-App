import 'package:flutter/material.dart';
import 'package:mini_project/blog.dart';
import 'package:mini_project/drawer.dart';
import 'package:mini_project/events.dart';
import 'package:mini_project/first_page.dart';
import 'package:mini_project/login_page.dart';
import 'package:mini_project/my_apointment.dart';
import 'package:mini_project/my_records.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List screens = <Widget>[
    FirstPage(),
    LoginPage(),
    MyApointment(),
    MyRecords(),
    Events(),
    Blog(),
  ];
  Widget currScreen = screens[0];

  //for switching screens
  void switchScreen(int id) {
    setState(() {
      currScreen = screens[id];
    });
    //can be used for making whole page
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (BuildContext context) => screens[id]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text(
          "Nasha Mukt Bharat",
          style: TextStyle(color: Colors.black45),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 109, 158, 53),
      ),
      //drawer
      drawer: MyDrawer(switchScreen: switchScreen),
      //body
      body: currScreen,
    );
  }
}
