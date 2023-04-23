import 'package:flutter/material.dart';
import 'package:ta/screen/notifications/page/tidakadanotifPage.dart';

class sudahdibacaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFFCCD2E3);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 99, left: 18),
                  child: const Text(
                    "Notifikasi",
                    style: TextStyle(
                      fontFamily: 'Oxygen',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 99, right: 29, left: 67),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Tandai Sudah Dibaca",
                    style: TextStyle(color: Color.fromARGB(255, 143, 134, 134)),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 175, 167, 167)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),

          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 7),
                  width: 296,
                  height: 62,
                  decoration:  const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Text(
                    "Pesanan anda dari buket uang toba sedang diproses",
                    style: TextStyle(fontWeight: FontWeight.w400,
                        fontFamily: 'Oxygen',
                        fontSize: 16,
                        color: Color.fromARGB(255, 175, 167, 167) ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: IconButton(
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: Card(
                              color: Colors.white,
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset('assets/images/icon_alert.png',
                                    fit: BoxFit.cover),
                                    Container(
                                      child: Text("Yakin ingin menghapus data ini?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700, fontFamily: 'Inter',
                                        fontSize: 16, color: Colors.black
                                      ),),
                                    ),
                                    Container(
                                      child: Text(
                                        "Data yang sudah dihapus tidak dapat kembali",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  // Tutup popup card dan kembali ke halaman sebelumnya
                                                  Navigator.of(context).pop();
                                                },
                                              child: Text("Kembali",
                                              style: TextStyle(color: Colors.black),),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all<Color>(
                                                      const Color.fromARGB(
                                                          255, 255, 253, 253)),
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => tidakadanotifPage()),
                                                  );
                                                },
                                              child: Text("OKE"),
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(
                                                    const Color.fromARGB(255, 49, 68, 55)),
                                              )

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        );
                      },
                      icon: Icon(Icons.delete, size: 50,color: Colors.black,)),
                ),
              ],

            ),
          )
        ],
      ),
    );
  }
}
