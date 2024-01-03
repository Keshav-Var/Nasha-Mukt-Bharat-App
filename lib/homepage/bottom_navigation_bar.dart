import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final void Function(int) callback;
  final int selectedItem;
  const BottomNavigation(
      {required this.selectedItem, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
        height: 60,
        color: const Color.fromARGB(255, 109, 158, 53),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavigationItem(
              id: 0,
              title: "Home",
              icon: Icons.home,
              callback: callback,
              selected: (selectedItem == 0),
            ),
            NavigationItem(
              id: 1,
              title: "Centre",
              icon: FontAwesomeIcons.solidSquarePlus,
              callback: callback,
              selected: (selectedItem == 1),
            ),
            NavigationItem(
              id: 2,
              title: "Blogs",
              icon: FontAwesomeIcons.blog,
              callback: callback,
              selected: (selectedItem == 2),
            ),
            NavigationItem(
              id: 3,
              title: "Event",
              icon: Icons.event,
              callback: callback,
              selected: (selectedItem == 3),
            ),
            NavigationItem(
              id: 4,
              title: "Appointments",
              icon: FontAwesomeIcons.solidCalendarCheck,
              callback: callback,
              selected: (selectedItem == 4),
            ),
          ],
        ));
  }
}

class NavigationItem extends StatelessWidget {
  final int id;
  final IconData icon;
  final String title;
  final void Function(int) callback;
  final bool selected;
  const NavigationItem(
      {required this.id,
      required this.icon,
      required this.title,
      required this.callback,
      super.key,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          callback(id);
        },
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: selected
                    ? const Color.fromARGB(189, 196, 236, 198)
                    : Colors.black45,
                size: selected ? 30 : 27,
                weight: selected ? 800 : 400,
              ),
              Text(
                title,
                style: TextStyle(
                  color: selected
                      ? const Color.fromARGB(189, 196, 236, 198)
                      : Colors.black45,
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
