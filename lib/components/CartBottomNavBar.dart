import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta/components/custom_webview.dart';
import 'package:ta/screen/checkoutPage.dart';

class CartBottomNavBar extends StatefulWidget {
  final int token;
  const CartBottomNavBar({Key? key, required this.token}) : super(key: key);

  @override
  State<CartBottomNavBar> createState() => _CartBottomNavBarState();
}

class _CartBottomNavBarState extends State<CartBottomNavBar> {
  List produk = [];
  bool isLoading = false;
  var total;
  @override
  void initState() {
    super.initState();
    this.getdata();
  }

  void getdata() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse(
          'http://bouquet.pnseirampah-semodal.com/api/keranjang/' +
              widget.token.toString()));
      print('produk response detail produk : ' + response.body.toString());
      if (response.statusCode == 200) {
        var item = json.decode(response.body)['data'];
        // print(item);
        setState(() {
          produk = item;
          isLoading = false;
        });
        total = 0;
        for (var i = 0; i < produk.length; i++) {
          // convert harga be int
          var harga = int.parse(produk[i]['harga']);
          // convert jumlah ke int
          var jumlah = int.parse(produk[i]['kuantitas']);
          // hitung total
          total = total + (harga * jumlah);
        }
      } else {
        produk = [];
        isLoading = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getCheckout(
    String user_id,
    String toko_id,
    List<String> produk_id,
    String alamat,
    String nama_penerima,
    String nomor_telepon,
    String catatan,
    BuildContext context,
  ) async {
    // print('user_id: ' + user_id);
    // print('toko_id: ' + toko_id.toString());
    // print('produk_id: ' + jsonEncode(produk_id));
    // print('alamat: ' + alamat.toString());
    // print('nama_penerima: ' + nama_penerima.toString());
    // print('nomor_telepon: ' + nomor_telepon.toString());
    // print('catatan: ' + catatan.toString());

    try {
      setState(() {
        isLoading = true;
      });

      // show data in parameter

      var response = await http.post(
        Uri.parse('http://bouquet.pnseirampah-semodal.com/api/checkout'),
        body: {
          'user_id': user_id,
          'toko_id': toko_id.toString(),
          'produk_id': jsonEncode(produk_id),
          'alamat': alamat.toString(),
          'nama_penerima': nama_penerima.toString(),
          'nomor_telepon': nomor_telepon.toString(),
          'catatan': catatan.toString(),
        },
      );

      print('checkout response: ' + response.body.toString());

      // Redirect After Request Checkout
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CustomWebview(
                    redirectUrl:
                        "https://checkout-staging.xendit.co/v2/6480411b79b419e752b20b3d",
                  )));

      if (response.statusCode == 200) {
        // Success
        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(),
          ),
        );
      } else {
        // Failure
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Checkout'),
              content: Text('An error occurred during checkout.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Checkout Error'),
            content: Text('An error occurred during checkout.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp. " + total.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width:
                  double.infinity, // it takes the whole diameter of the screen
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 68, 55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  // connect to function getCheckout and redirect to checkoutPage
                  getCheckout(
                    '3',
                    '1',
                    ['3', '4'],
                    'alamat',
                    'test',
                    '08136282411',
                    'catatan',
                    context,
                  );
                },
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
