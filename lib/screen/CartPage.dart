
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/CartAppBar.dart';
import '../components/CartBottomNavBar.dart';
import '../components/CartItemSamples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // navbar
          CartAppBar(),
          Container(
            height: MediaQuery.of(context).size.height-218, // we have to change this
            padding: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // producos del carrito
                  CartItemSamples(),

                  // agragr cupon
                  Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15), // this was before
                    margin: EdgeInsets.fromLTRB(15,0,15,15),
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
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
