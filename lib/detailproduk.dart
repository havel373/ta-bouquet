import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ta/themes/color.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_rating/awesome_rating.dart';

class DetailProduk extends StatefulWidget {
  final int id;
  final int token;
  DetailProduk({Key? key, required this.id, required this.token})
      : super(key: key);

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  List produk = [];
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
          'http://bouquet.pnseirampah-semodal.com/api/produk/' +
              widget.id.toString()));
      print('produk response detail produk : ' + response.body.toString());
      if (response.statusCode == 200) {
        var item = json.decode(response.body)['data'];
        print(item);
        setState(() {
          produk = [item];
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 195, 96),
        title: Text("Detail Bouquet"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    print('Testing : ' + produk.toString());
    if (produk.contains(null) || produk.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ));
    }
    print('length : ' + produk.length.toString());
    return ListView(children: produk.map((item) => getCard(item)).toList());
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

  Widget getCard(item) {
    var namaProduk = item['nama'];
    var deskripsi = item['deskripsi'];
    var gambar = item['gambar'];
    var harga = item['harga'];
    var nama_toko = item['nama_toko'];

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          // make image be rounded rectangle
          Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(gambar), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: 350,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 1)
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaProduk,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primary),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rp. ' + harga.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                // make rating star in a row
                AwesomeStarRating(
                  size: 20,
                  color: Colors.yellow,
                  borderColor: Colors.grey,
                  rating: 4,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 350,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 1)
            ]),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(gambar), fit: BoxFit.cover)),
                ),
                Text(
                  nama_toko,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Container(
            height: 10,
            width: 300,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 5, spreadRadius: 1)
            ]),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    postCart();
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: primary),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Keranjang',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // make function to add to cart
                    // addCart();
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: primary),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Beli Sekarang',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
