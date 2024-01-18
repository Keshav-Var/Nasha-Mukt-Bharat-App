import 'package:flutter/material.dart';
import 'package:mini_project/pages/blog_page.dart';
import 'package:mini_project/homepage/bottom_navigation_bar.dart';
import 'package:mini_project/homepage/drawer.dart';
import 'package:mini_project/pages/center_list_page.dart';
import 'package:mini_project/pages/events_page.dart';
import 'package:mini_project/homepage/first_page.dart';
import 'package:mini_project/pages/my_apointment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const List screens = <Widget>[
    FirstPage(),
    CenterListPage(),
    Blog(),
    Events(),
    MyApointment(),
  ];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currScreen = HomePage.screens[0];
  int selectedInBottomNav = 0;

  //for set new screens(for bottom navigation bar)
  void switchScreen(int id) {
    setState(
      () {
        currScreen = HomePage.screens[id];
        selectedInBottomNav = id;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text(
          "Nasha Mukt Bharat",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 109, 158, 53),
                  width: 1.5,
                ),
              ),
              child: const Image(
                image: AssetImage("assets/images/profile.png"),
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 20,
      ),
      //drawer
      drawer: const MyDrawer(),
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
