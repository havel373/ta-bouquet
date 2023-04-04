import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ta/themes/color.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ta/screen/CartPage.dart';

class ItemBottomNavBar extends StatefulWidget {
  final int id;
  final int token;
  ItemBottomNavBar({Key? key, required this.id, required this.token})
      : super(key: key);

  @override
  _ItemBottomNavBarState createState() => _ItemBottomNavBarState();
}

class _ItemBottomNavBarState extends State<ItemBottomNavBar> {
  List produk = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  void postCart() async {
    try {
      print("user ID:" + widget.token.toString());
      var response = await http.post(
          Uri.parse('http://bouquet.pnseirampah-semodal.com/api/keranjang'),
          body: {
            'kuantitas': '1',
            'produk_id': widget.id.toString(),
            'user_id': widget.token.toString(),
          });
      print('response : ' + response.body.toString());
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Berhasil'),
                content: Text('Produk berhasil ditambahkan ke keranjang'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });
      }
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rp.120.000',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                postCart();
              },
              icon: const Icon(CupertinoIcons.cart_badge_plus),
              label: const Text(
                "Masukkan Ke Keranjang",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 49, 68, 55)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13,horizontal: 15)
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
