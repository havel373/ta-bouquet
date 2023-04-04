import 'dart:convert';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../components/IntemBottomNavBar.dart';
import '../components/ItemAppBar.dart';

import 'package:http/http.dart' as http;

class ItemPage extends StatefulWidget {
  final int id;
  final int token;
  const ItemPage({Key? key, required this.id, required this.token})
      : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<Color> Clrs = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.indigo,
    Colors.orange
  ];
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
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 21, 195, 96),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${produk[0]['gambar']}"))),
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40,
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Detail Produk",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 235, 56, 56),
                            ),
                            onRatingUpdate: (index) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Text(
                              "${produk[0]['deskripsi']}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }
}
