import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ta/themes/color.dart';
import 'package:http/http.dart' as http;

// make detail product view with stateful widget and get id from dashboard share
class DetailProduk extends StatefulWidget {
  final String id;
  DetailProduk({Key? key, required this.id}) : super(key: key);

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  // make list only one item
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
      // get detailproduk with id
      var response = await http.get(Uri.parse(
          'http://bouquet.pnseirampah-semodal.com/api/produk/' + widget.id));
      print('produk response detail produk : ' + response.body.toString());
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
    return Scaffold(
      // make background color white
      backgroundColor: Colors.white,
      appBar: AppBar(
        // make appbar transparent
        backgroundColor: Color.fromARGB(255, 21, 195, 96),
        title: Text("Bouquet Produk"),
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

  Widget getCard(item) {
    var namaProduk = item['nama'];
    var deskripsi = item['deskripsi'];
    var gambar = item['gambar'];

    // make page detail product
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(gambar), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            namaProduk,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            deskripsi,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Beli"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 21, 195, 96)),
            ),
          )
        ],
      ),
    );
  }
}
