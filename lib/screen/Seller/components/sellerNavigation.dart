import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta/screen/profiles/page/useraccountPage.dart';

import '../../HomePage.dart';
import '../../notifications/page/NotificationPage.dart';
import '../pages/sellernotifi_page.dart';
import '../pages/storePage.dart';
import '../profileseller/seller_account_page.dart';


class SellerNavigation extends StatefulWidget {
  final int token;

  SellerNavigation({required this.token});

  @override
  _SellerNavigationState createState() => _SellerNavigationState();
}
class _SellerNavigationState extends State<SellerNavigation> {
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
          NotifikasiApp(),
          StorePage(token: widget.token),
          SelleraccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.green,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront),
          label: 'Store'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}