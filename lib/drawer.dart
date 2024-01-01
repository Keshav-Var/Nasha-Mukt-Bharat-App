import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) switchScreen;
  const MyDrawer({required this.switchScreen, super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 241, 250, 231),
      child: ListView(
        children: <Widget>[
          const DrawerHead(),
          ListItem(
            title: "Login",
            icon: Icons.login,
            id: 1,
            callback: switchScreen,
          ),
          ListItem(
            title: "My Appointment",
            icon: Icons.app_registration_outlined,
            id: 2,
            callback: switchScreen,
          ),
          ListItem(
            title: "My records",
            icon: FontAwesomeIcons.clipboard,
            id: 3,
            callback: switchScreen,
          ),
          ListItem(
            title: "Events",
            icon: Icons.event,
            id: 4,
            callback: switchScreen,
          ),
          ListItem(
            title: "Blog",
            icon: FontAwesomeIcons.blog,
            id: 5,
            callback: switchScreen,
          ),
        ],
      ),
    );
  }
}

class DrawerHead extends StatelessWidget {
  const DrawerHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: const Color.fromARGB(255, 109, 158, 53),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            foregroundImage: AssetImage("lib/assets/images/logo.jpeg"),
          ),
          Text(
            "Name",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final void Function(int) callback;
  final String title;
  final IconData icon;
  final int id;
  const ListItem(
      {required this.id,
      required this.title,
      required this.icon,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, color: Colors.black45),
      ),
      leading: Icon(
        icon,
        size: 18,
        color: Colors.black45,
      ),
      onTap: () {
        Navigator.pop(context);
        callback(id);
      },
    );
  }
}
