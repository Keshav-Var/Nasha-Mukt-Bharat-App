import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/pages/blog_page.dart';
import 'package:mini_project/homepage/bottom_navigation_bar.dart';
import 'package:mini_project/homepage/drawer.dart';
import 'package:mini_project/pages/center_list_page.dart';
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
    CenterListPage(),
    Blog(),
    Events(),
    MyApointment(),
    LoginPage(),
    MyRecords(),
  ];
  Widget currScreen = screens[0];
  int selectedInBottomNav = 0;
  //for switching screens(for bottom navigation bar)
  void switchScreen(int id) {
    setState(() {
      currScreen = screens[id];
      selectedInBottomNav = id;
    });
  }

  //can be used for push page(for drawer)
  void pushScreen(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => screens[id]),
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
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 109, 158, 53),
                  width: 1.5,
                ),
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("lib/assets/images/profile.png"),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
              ),
            ),
          )
        ],
        centerTitle: true,
        elevation: 20,
      ),
      //drawer
      drawer: MyDrawer(switchScreen: pushScreen),
      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigation(
        selectedItem: selectedInBottomNav,
        callback: switchScreen,
      ),
      //body
      body: currScreen,
      extendBodyBehindAppBar: true,
    );
  }
}
