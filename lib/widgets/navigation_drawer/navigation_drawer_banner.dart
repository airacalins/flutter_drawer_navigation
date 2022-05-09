// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigationDrawerBanner extends StatelessWidget {
  const NavigationDrawerBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/drawer.jpg')
        ),
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Aira Calins',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'airacalins@gmail.com',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
