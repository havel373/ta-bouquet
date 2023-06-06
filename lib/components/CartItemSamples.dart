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

import '../components/CartAppBar.dart';
import '../components/CartBottomNavBar.dart';
import '../components/CartItemSamples.dart';

class CartItemSamples extends StatefulWidget {
  final int token;
  const CartItemSamples({Key? key, required this.token}) : super(key: key);

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
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
          'http://bouquet.pnseirampah-semodal.com/api/keranjang/' +
              widget.token.toString()));
      print('produk response detail produk : ' + response.body.toString());
      if (response.statusCode == 200) {
        var item = json.decode(response.body)['data'];
        print(item);
        setState(() {
          produk = item;
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

  void deleteData(String id) async {
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
          produk.remove(item);
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.5,
      ),
      itemCount: produk.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        return Column(
          children: [
            Container(
              height: 110,
              margin: EdgeInsets.symmetric(
                  horizontal: 15), // before it was this -> , vertical: 10
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Radio(
                      value: "",
                      groupValue: '',
                      activeColor: Color.fromARGB(255, 0, 0, 0),
                      onChanged: (index) {},
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(60 / 2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${produk[index]['gambar_produk']}"))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.blue,
                          width: 150,
                          height: 20,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "${produk[index]['produk']['nama']}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Rp. ${produk[index]['harga']}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.all(0),
                                        content: Card(
                                          color: Colors.white,
                                          child: Container(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Image.asset(
                                                    'assets/images/icon_alert.png',
                                                    fit: BoxFit.cover),
                                                Container(
                                                  child: Text(
                                                    "Yakin ingin menghapus data ini?",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: 'Inter',
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "Data yang sudah dihapus tidak dapat kembali",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              // Tutup popup card dan kembali ke halaman sebelumnya
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              "Kembali",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          255,
                                                                          253,
                                                                          253)),
                                                            )),
                                                      ),
                                                      Container(
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              // deleteData produk[index]['id'].toString(); using api
                                                              deleteData(produk[
                                                                          index]
                                                                      ['id']
                                                                  .toString());
                                                              // reload page
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text("OKE"),
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          49,
                                                                          68,
                                                                          55)),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 50,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
