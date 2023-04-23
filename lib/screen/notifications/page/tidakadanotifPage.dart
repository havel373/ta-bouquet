import 'package:flutter/material.dart';

class tidakadanotifPage extends StatelessWidget {
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
                      color: Colors.black,
                      fontFamily: 'Oxygen',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            child: Image.asset('assets/images/icon_tidakadanotif.png',
            fit: BoxFit.contain),
          ),
          SizedBox(height: 50),

          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {  },
              child: Text("Tidak Ada Notifikasi",
              style: TextStyle(color: Colors.black),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(
                    255, 243, 206, 175)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
