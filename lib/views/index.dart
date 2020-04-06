import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:rmi/views/home.dart';
import 'package:rmi/views/covid.dart';
import 'package:rmi/views/about.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Covid(),
    About(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.home,
              size: 30.0,
            ),
            title: Text('Rumah'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.gift,
              size: 30.0,
            ),
            title: Text('Donasi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.globe,
              size: 30.0,
            ),
            title: Text('Tentang'),
          ),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}
