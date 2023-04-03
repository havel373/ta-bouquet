import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // goes back tgo teh previous pegae/screen
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, size: 30,
              color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Keranjang",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert, size: 30,
            color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
          ),
        ],
      ),
    );
  }
}
