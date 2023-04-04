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

class HomeAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> data;
  final int token;
  HomeAppBar({Key? key, required this.data, required this.token})
      : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15), // before it as 25
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            'DEL BOUQUET APP',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute( 
                    builder: (context) => CartPage(
                          token: widget.token,
                        )));
          },
        ),
      ]),
    );
  }
}
