import 'package:flutter/material.dart';

import '../components/Carrusel.dart';
import '../components/HomeAppBar.dart';
import '../components/ItemsWidgets.dart';

class HomePage extends StatefulWidget {
  final int token;
  const HomePage({Key? key, required this.token}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: ListView(
        children: [
          HomeAppBar(data: _scaffoldState, token: widget.token),
          Container(
            // height: 500,
            padding: EdgeInsets.only(top: 15),

            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
            ),
            child: Column(
              children: [
                // CARRUCEL
                Carrusel(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Produk Kami",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), //0xFF4C53A2
                    ),
                  ),
                ),
                ItemsWidget(
                  token: widget.token,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
