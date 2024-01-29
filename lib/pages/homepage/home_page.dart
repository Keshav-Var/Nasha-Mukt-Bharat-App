import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/pages/blog_page.dart';
import 'package:mini_project/pages/homepage/bottom_navigation_bar.dart';
import 'package:mini_project/pages/homepage/drawer.dart';
import 'package:mini_project/pages/center_list_page.dart';
import 'package:mini_project/pages/events_page.dart';
import 'package:mini_project/pages/homepage/first_page.dart';
import 'package:mini_project/pages/login_page.dart';
import 'package:mini_project/pages/my_apointment_page.dart';
import 'package:mini_project/pages/signup_page.dart';
import 'package:mini_project/pages/verify_email_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const VerificationPage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went out!"),
            );
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  void toggle() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? LoginPage(callback: toggle) : SignupPage(callback: toggle);
  }
}

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
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
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
