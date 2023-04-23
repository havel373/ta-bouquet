import 'package:flutter/material.dart';
import 'package:ta/screen/notifications/page/sudahdibacaPage.dart';
import 'package:ta/screen/notifications/page/tidakadanotifPage.dart';

class checkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFFCCD2E3);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only( top: 20, left: 18),
                  child: const Text(
                    "Pesanan Saya",
                    style: TextStyle(
                        fontFamily: 'Oxygen',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Shipping Address",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                      "Jl. Eka Rasmi Gg. Saudara, Gedung Johor, Kec. Medan Johor, Kota Medan, Sumatera Utara 20147",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}
