import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/routes/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerHead(),
          SizedBox(
            height: 30,
          ),
          ListItem(
            title: "Login",
            icon: Icons.login,
            routeName: AppRoutes.login,
          ),
          ListItem(
            title: "My activities",
            icon: FontAwesomeIcons.clipboard,
            routeName: AppRoutes.article,
          ),
          ListItem(
            title: "About us",
            icon: FontAwesomeIcons.circleInfo,
            routeName: AppRoutes.article,
          ),
          ListItem(
            title: "Contact us",
            icon: FontAwesomeIcons.phone,
            routeName: AppRoutes.article,
          ),
          Divider(
            thickness: 1,
            color: Colors.black45,
            indent: 20,
            endIndent: 40,
          ),
          ListItem(
            title: "Invite your friend",
            icon: FontAwesomeIcons.userPlus,
            routeName: AppRoutes.login,
          ),
          ListItem(
            title: "Rate us",
            icon: FontAwesomeIcons.solidStar,
            routeName: AppRoutes.login,
          ),
          ListItem(
            title: "Log out",
            icon: Icons.logout,
            routeName: AppRoutes.login,
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
            foregroundImage: AssetImage("assets/images/profile.png"),
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
  final String title;
  final IconData icon;
  final String routeName;
  const ListItem(
      {required this.title,
      required this.icon,
      required this.routeName,
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
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
