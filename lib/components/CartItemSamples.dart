import 'package:flutter/material.dart';
import 'package:ta/themes/color.dart';

class CartItemSamples extends StatelessWidget {
  final List produk;
  final Function(Map<String, dynamic> product) onDeleteProduct;

  const CartItemSamples(
      {super.key, required this.produk, required this.onDeleteProduct});

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
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.only(left: 25),
                                                  child: Image.asset(
                                                    'assets/images/icon_alert.png',
                                                    fit: BoxFit.contain)
                                                ),
                                                Container(
                                                  child: const Text(
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
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: const Text(
                                                    "Data yang sudah dihapus tidak dapat kembali",
                                                    style: TextStyle(
                                                        color: Colors.black,

                                                    ),
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
                                                              onDeleteProduct(
                                                                  produk[
                                                                      index]);
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
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 30,
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
