import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:ta/screen/ItemDetailPage.dart';
import 'package:ta/themes/color.dart';
import 'package:http/http.dart' as http;

class ItemsWidget extends StatefulWidget {
  final int token;
  const ItemsWidget({Key? key, required this.token}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List produk = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getdata();
  }

  void getdata() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http
          .get(Uri.parse('http://bouquet.pnseirampah-semodal.com/api/produk/'));
      print('produk response : ' + response.body.toString());
      if (response.statusCode == 200) {
        var items = json.decode(response.body)['data'];
        print(items);
        setState(() {
          produk = items;
          isLoading = false;
        });
      } else {
        produk = [];
        isLoading = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.60,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: produk.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // this was before
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemPage(
                                id: produk[index]['id'],
                                token: widget.token,
                              )));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: primary,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("${produk[index]['gambar']}"))),
                ),
              ),
              Container(
                height: 30,
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: Text(
                    "${produk[index]['nama']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: SingleChildScrollView(
                  child: Text(
                    "${produk[index]['deskripsi']}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rp. ${produk[index]['harga']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
