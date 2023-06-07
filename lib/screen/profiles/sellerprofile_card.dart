import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Seller/components/sellerNavigation.dart';

class SellerProfileCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Saya'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SellerNavigation(token: data['user']['id']),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/photo_profile.png'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Del Bouquet',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
