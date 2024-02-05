import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:mini_project/routes/routes.dart';

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
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance.collection('users');

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
    return FutureBuilder(
        future: db.doc(user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (snapshot.hasError) {
            return const Scaffold(
                body: Center(
              child: Text("Something went worng"),
            ));
          } else {
            final userInfo = snapshot.data!.data()!;
            return Scaffold(
              // appbar
              appBar: AppBar(
                title: const Text(
                  "Nasha Mukt Bharat",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                actions: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.profile),
                    child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: userInfo['profile'] == null
                            ? CircleAvatar(
                                backgroundImage: const AssetImage(
                                    "assets/images/profile.png"),
                                backgroundColor: Theme.of(context).primaryColor,
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userInfo['profile']!),
                                backgroundColor: Theme.of(context).primaryColor,
                              )),
                  )
                ],
                centerTitle: true,
                elevation: 20,
              ),
              //drawer
              drawer: MyDrawer(
                email: userInfo['email'],
                profile: userInfo['profile'],
              ),
              //Bottom Navigation Bar
              bottomNavigationBar: BottomNavigation(
                selectedItem: selectedInBottomNav,
                callback: switchScreen,
              ),
              //body
              body: currScreen,
            );
          }
        });
  }
}
