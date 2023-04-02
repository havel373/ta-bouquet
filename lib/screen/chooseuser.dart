
import 'package:flutter/material.dart';
import 'package:ta/screen/sign_in.dart';

class chooseuser extends StatelessWidget {
  const chooseuser({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
        Container(
          margin: const EdgeInsets.only(top: 0),
          width: 200,
          height: 45,
          child: ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff314437)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => loginpage()
                  )
              );
            },
              child: Text("Pembeli"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: 200,
            height: 45,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff314437)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => loginpage()
                    )
                );
              },
              child: Text("Penjual"),
            ),
          ),
        ]
        )
      )
    );
  }
}