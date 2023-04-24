import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta/screen/notifications/page/sudahdibacaPage.dart';
import 'package:ta/screen/notifications/page/tidakadanotifPage.dart';
import 'package:ta/screen/pilihmetodepembayaranPage.dart';

class checkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFFCCD2E3);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only( top: 20, left: 18),
                  child: const Text(
                    "Pesanan Saya",
                    style: TextStyle(
                        fontFamily: 'Oxygen',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Shipping Address",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                      "Jl. Eka Rasmi Gg. Saudara, Gedung Johor, Kec. Medan Johor, Kota Medan, Sumatera Utara 20147",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 32.0,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.only(left: 22),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 22,
                      height: 24,
                      child: Image.asset('assets/images/icon_pesanan.png',
                        fit: BoxFit.contain,),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 13),
                      child: const Text("Rincian Pembayaran",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Oxygen',
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                        ),),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 341,
                  height: 18,
                  child: Row(
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: 0),
                        child: Text(
                          "Subtotal untuk Produk",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 100),
                        child: Text(" Rp.145000",
                          style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 341,
                  height: 18,
                  child: Row(
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: 0),
                        child: Text(
                          "Subtotal Pengiriman",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 100),
                        child: Text(" Rp.20000",
                          style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 341,
                  height: 18,
                  child: Row(
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: 0),
                        child: Text(
                          "Total Pembayaran",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 100),
                        child: Text(" Rp.165000",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 32.0,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 18),
            child:
            Row(
              children: [
                Container(
                  width: 22,
                  height: 24,
                  child: Icon(CupertinoIcons.money_dollar, color: Colors.black)
                ),
                Container(
                  padding: EdgeInsets.only(left: 13),
                  child: const Text("Metode Pembayaran",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>PilihanPembayaran())
                      );
                    },
                    child: Text("Pilih Metode Pembayaran >")),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: ElevatedButton(
              onPressed: () {  },
              child: Text("Pesan"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 49, 68, 55)),
              ),

            ),
          ),




        ],
      ),
    );
  }
}
