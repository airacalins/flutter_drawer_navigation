// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_playground/dafaults/defaults.dart';
import 'package:flutter_playground/widgets/navigation_drawer/navigation_drawer_banner.dart';


int indexClicked = 0;

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Drawer Example ${indexClicked}'
        ),
      ),
      body: Screen(indexClicked: indexClicked),
      drawer: NavigationDrawer(),
    );
  }
}

class Screen extends StatelessWidget {
  final int indexClicked;
  const Screen({ Key? key, required this.indexClicked }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screens = [
      Center(child: Text('Inbox')),
      Center(child: Text('Starred')),
      Center(child: Text('Sent')),
      Center(child: Text('Drafts')),
      Center(child: Text('Trash')),
      Center(child: Text('Spam')),
    ];

    return screens[indexClicked];
  }
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({ 
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  void handleNavigation(int index) {
    setState(() {
      indexClicked = index;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          NavigationDrawerBanner(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                NavigationDrawerItem(
                  index: 0, 
                  onTap: handleNavigation
                ),
                NavigationDrawerItem(
                  index: 1, 
                  onTap: handleNavigation
                ),
                NavigationDrawerItem(
                  index: 2, 
                  onTap: handleNavigation
                ),
                NavigationDrawerItem(
                  index: 3, 
                  onTap: handleNavigation
                ),
                NavigationDrawerItem(
                  index: 4, 
                  onTap: handleNavigation
                ),
                NavigationDrawerItem(
                  index: 5, 
                  onTap: handleNavigation
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class NavigationDrawerItem extends StatelessWidget {
  final int index;
  final Function onTap;

  const NavigationDrawerItem({ 
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(index),
      selected: indexClicked == index,
      selectedColor: Colors.amber.shade100,
      leading: Icon(
        Defaults.drawerItemIcon[index],
        size: 35,
        color: indexClicked == index 
          ? Defaults.drawerItemSelectedColor 
          : Defaults.drawerItemColor,
      ),
      title: Text(
        Defaults.drawerItemText[index],
        style: TextStyle(
          color: indexClicked == index
          ? Defaults.drawerItemSelectedColor 
          : Defaults.drawerItemColor,
        ),
      ),
    );
  }
}