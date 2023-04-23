import 'package:flutter/material.dart';
import 'package:ta/themes/color.dart';

class editProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(0xFFCCD2E3);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 73),
            child: Image.asset('assets/images/photo_profile.png'),
          ),
          const SizedBox(height: 15),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Nama Pengguna",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                fontFamily: 'Oxygen',
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Alamat Email",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Nomor Telepon",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Alamat Lengkap",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Nama Jalan",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Kode Pos",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 328,
            height: 37,
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 12.0),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                color: Colors.black
              ),
            ),

          ),
          const SizedBox(height: 30),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {  },
              child: Text("Simpan"),

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 49, 68, 55)),
                )
              
            ),
          )
          
        ],
      ),
    );
  }
}
