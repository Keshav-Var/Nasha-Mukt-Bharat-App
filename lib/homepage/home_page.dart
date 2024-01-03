import 'package:flutter/material.dart';
import 'package:mini_project/pages/blog_page.dart';
import 'package:mini_project/homepage/bottom_navigation_bar.dart';
import 'package:mini_project/homepage/drawer.dart';
import 'package:mini_project/pages/events_page.dart';
import 'package:mini_project/homepage/first_page.dart';
import 'package:mini_project/pages/login_page.dart';
import 'package:mini_project/pages/my_apointment_page.dart';
import 'package:mini_project/pages/my_records_page.dart';

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
  int selectedInBottomNav = 1;
  //for switching screens
  void switchScreen(int id) {
    setState(() {
      currScreen = screens[id];
      selectedInBottomNav = id;
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
      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigation(
        selectedItem: selectedInBottomNav,
        callback: switchScreen,
      ),
      //body
      body: currScreen,
    );
  }
}
