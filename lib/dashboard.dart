import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ta/themes/color.dart';
import 'package:http/http.dart' as http;

import 'detailproduk.dart';

class Dashboard extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<Dashboard> {
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
    if (produk.contains(null) || produk.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(primary),
      ));
    }
    print('length : ' + produk.length.toString());
    return ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, index) {
          return getCard(produk[index]);
        });
  }

  Widget getCard(item) {
    var namaProduk = item['nama'];
    var deskripsi = item['deskripsi'];
    var gambar = item['gambar'];
    return Card(
      // make card background color white
      color: Colors.white,
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(gambar))),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: Text(namaProduk,
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // batasin panjang deskripsi
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text(
                        deskripsi,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProduk(
                                    id: item['id'].toString(),
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "Detail",
                        style: TextStyle(color: primary),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
