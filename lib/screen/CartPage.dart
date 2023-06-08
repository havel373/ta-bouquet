import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List listCarts = [];
  bool isLoading = false;
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
        print(item);
        setState(() {
          listCarts = item;
          isLoading = false;
        });
      } else {
        listCarts = [];
        isLoading = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData(String id) async {
    listCarts.removeWhere((element) => "${element['id']}" == id);
    setState(() {});
    try {
      var url = Uri.parse(
          'http://bouquet.pnseirampah-semodal.com/api/keranjang/' + id);

      var response = await http.delete(url);
      print('Delete response: ${response.statusCode}');

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        var item = responseBody['data'];
        print('item dihapus: $item');
        setState(() {
          listCarts.remove(item);
        });
      } else {
        print('Delete gagal. Pesan Error: ${response.body}');
      }
    } catch (e) {
      print('Error delete data: $e');
    }
  }

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
                    produk: listCarts,
                    onDeleteProduct: (product) {
                      //  using api
                      deleteData(product['id'].toString());
                      // reload page
                      Navigator.of(context).pop();
                    },
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
        listCarts: listCarts,
      ),
    );
  }
}
