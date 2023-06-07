import 'package:flutter/material.dart';

import '../components/CartAppBar.dart';
import '../components/CartBottomNavBar.dart';
import '../components/CartItemSamples.dart';

class CartPage extends StatefulWidget {
  final int token;
  CartPage({Key? key, required this.token}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // navbar
          CartAppBar(),
          Container(
            height: MediaQuery.of(context).size.height -
                218, // we have to change this
            padding: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CartItemSamples(
                    token: widget.token,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    padding: EdgeInsets.all(10),
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(
        token: widget.token,
      ),
    );
  }
}
