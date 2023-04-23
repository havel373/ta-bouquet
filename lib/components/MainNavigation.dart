import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta/screen/profiles/page/useraccountPage.dart';

import '../screen/HomePage.dart';
import '../screen/notifications/page/NotificationPage.dart';

class MainNavigation extends StatefulWidget {
  final int token;

  MainNavigation({required this.token});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}
class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(token: widget.token),
          NotificationPage(),
          useraccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}