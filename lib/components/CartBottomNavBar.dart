import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ta/components/custom_webview.dart';
import 'package:ta/core/session/user_storage.dart';

class CartBottomNavBar extends StatefulWidget {
  final int token;
  final List listCarts;
  const CartBottomNavBar(
      {Key? key, required this.token, required this.listCarts})
      : super(key: key);

  @override
  State<CartBottomNavBar> createState() => _CartBottomNavBarState();
}

class _CartBottomNavBarState extends State<CartBottomNavBar> {
  Dio dio = Dio();

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

  Future showAddressReceipent() async {
    TextEditingController addressController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .75,
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              TextFormField(
                controller: addressController,
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Alamat pengiriman",
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Nomor Telepon",
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: noteController,
                minLines: 4,
                maxLines: 8,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: "Catatan",
                ),
              ),
              SizedBox(height: 24),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double
                    .infinity, // it takes the whole diameter of the screen
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 49, 68, 55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    if (addressController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      Map<String, dynamic> additionalData = {
                        "address": addressController.text,
                        "phone": phoneController.text,
                        "note": phoneController.text
                      };
                      Navigator.pop(context, additionalData);
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Warning'),
                              content: Text('Silahkan lengkapi data'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    }
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void createCheckout() async {
    final additionalData = await showAddressReceipent();
    if (additionalData != null) {
      try {
        setState(() {
          isLoading = true;
        });

        // show data in parameter

        Map<String, dynamic> requestBody = {
          'user_id': storage.user?.id,
          'toko_id': produk[0]['toko_id'],
          'produk_id': produk.map((e) => e['produk_id']).toList(),
          'nama_penerima': "${storage.user?.name}",
          'alamat': additionalData['address'],
          'nomor_telepon': additionalData['phone'],
          'catatan': additionalData['note'],
        };
        log("Requst Body $requestBody");
        var response = await dio.post(
          'http://bouquet.pnseirampah-semodal.com/api/checkout',
          data: requestBody,
          options: Options(headers: {
            "Authorization": "Bearer ${storage.authorization?.access_token}",
            "Accept": "application/json",
          }),
        );

        if (response.statusCode == 200) {
          log("Response => ${jsonEncode(response.data)}");
          // Success
          final resultData = response.data;
          await createInvoice(resultData['data']['id']);

          setState(() {
            isLoading = false;
          });
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
        if (e is DioException) {
          log("Error => ${e.response?.data}");
        }
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
  }

  Future createInvoice(int checkoutId) async {
    var response = await dio.post(
      'http://bouquet.pnseirampah-semodal.com/api/xendit/va/invoice',
      data: FormData.fromMap(
        {
          "pesanan_id": checkoutId,
          "name": storage.user?.name,
          "email": storage.user?.email,
          "amount": total,
        },
      ),
      options: Options(headers: {
        "Accept": "application/json",
      }),
    );
    if (response.statusCode == 200) {
      // Redirect After Request Checkout
      final resultData = response.data;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CustomWebview(
                    redirectUrl: resultData['invoice_url'],
                  )));
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
                  if (!isLoading) createCheckout();
                },
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
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
