import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const MyDrawerHearder(),
          listItem(
            title: "Login/Signup",
            icon: Icons.login_outlined,
          ),
        ],
      ),
    );
  }
}

Widget listItem({required final String title, required final IconData icon}) {
  const textStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.black,
      weight: 900,
    ),
    title: Text(title),
    titleTextStyle: textStyle,
  );
}

class MyDrawerHearder extends StatelessWidget {
  const MyDrawerHearder({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(color: Colors.deepPurple),
      padding: EdgeInsets.all(4),
      child: Center(
        child: CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.people,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
