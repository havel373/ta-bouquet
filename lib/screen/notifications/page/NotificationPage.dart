import 'package:flutter/material.dart';
import 'package:ta/screen/notifications/page/sudahdibacaPage.dart';
import 'package:ta/screen/notifications/page/tidakadanotifPage.dart';

class NotificationPage extends StatelessWidget {
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
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>sudahdibacaPage()));
                    },
                    child: Text("Tandai Sudah Dibaca"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 49, 68, 55)),
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
                    style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Oxygen', fontSize: 16),
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
                                            fontSize: 16
                                        ),),
                                    ),
                                    Container(
                                      child: Text(
                                          "Data yang sudah dihapus tidak dapat kembali"
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                                onPressed: () {
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
